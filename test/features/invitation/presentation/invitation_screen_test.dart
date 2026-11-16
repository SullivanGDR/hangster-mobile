import 'package:cupertino_ui/cupertino_ui.dart'
    show GlobalCupertinoLocalizations;
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalWidgetsLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hangster_mobile/app/theme/app_theme.dart';
import 'package:hangster_mobile/features/auth/data/fake_auth_repository.dart';
import 'package:hangster_mobile/features/auth/presentation/auth_providers.dart';
import 'package:hangster_mobile/features/invitation/data/fake_invitation_repository.dart';
import 'package:hangster_mobile/features/invitation/presentation/invitation_screen.dart';
import 'package:hangster_mobile/l10n/generated/app_localizations.dart';
import 'package:material_ui/material_ui.dart';

import '../../../support/signed_in.dart';

Future<GoRouter> _pump(
  WidgetTester tester, {
  required String code,
  required FakeInvitationRepository repo,
  required bool signedIn,
}) async {
  final router = GoRouter(
    initialLocation: '/i/$code',
    routes: [
      GoRoute(
        path: '/i/:code',
        builder: (_, s) => InvitationScreen(code: s.pathParameters['code']!),
      ),
      GoRoute(path: '/', builder: (_, _) => const Text('page-home')),
      GoRoute(path: '/login', builder: (_, _) => const Text('page-login')),
      GoRoute(path: '/signup', builder: (_, _) => const Text('page-signup')),
    ],
  );
  addTearDown(router.dispose);
  final List<Override> overrides = [
    if (signedIn)
      ...signedInOverrides()
    else
      authRepositoryProvider.overrideWithValue(
        FakeAuthRepository(latency: Duration.zero),
      ),
    invitationRepositoryProvider.overrideWithValue(repo),
  ];
  await tester.pumpWidget(
    ProviderScope(
      overrides: overrides,
      child: MaterialApp.router(
        theme: AppTheme.light(),
        locale: const Locale('fr'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
      ),
    ),
  );
  await tester.pumpAndSettle();
  return router;
}

void main() {
  FakeInvitationRepository newRepo() =>
      FakeInvitationRepository(latency: Duration.zero);

  testWidgets("affiche l'aperçu du groupe", (tester) async {
    await _pump(tester, code: 'jeudis', repo: newRepo(), signedIn: false);
    expect(find.text('Les Jeudis'), findsOneWidget);
    expect(find.text('6 membres'), findsOneWidget);
    expect(find.text('Un vote est ouvert'), findsOneWidget);
  });

  testWidgets('code inconnu : message et retour', (tester) async {
    await _pump(tester, code: 'nope', repo: newRepo(), signedIn: false);
    expect(find.text('Invitation introuvable'), findsOneWidget);
    expect(find.text('Rejoindre'), findsNothing);
  });

  testWidgets('connecté : rejoindre puis accueil', (tester) async {
    final repo = newRepo();
    await _pump(tester, code: 'jeudis', repo: repo, signedIn: true);
    await tester.tap(find.text('Rejoindre'));
    await tester.pumpAndSettle();
    expect(repo.joined, contains('jeudis'));
    expect(find.text('page-home'), findsOneWidget);
  });

  testWidgets('non connecté : redirige vers la connexion avec from', (
    tester,
  ) async {
    final router = await _pump(
      tester,
      code: 'jeudis',
      repo: newRepo(),
      signedIn: false,
    );
    await tester.tap(find.text('Se connecter pour rejoindre'));
    await tester.pumpAndSettle();
    expect(find.text('page-login'), findsOneWidget);
    expect(
      router.routerDelegate.currentConfiguration.uri.queryParameters['from'],
      '/i/jeudis',
    );
  });

  testWidgets("non connecté : lien vers l'inscription", (tester) async {
    await _pump(tester, code: 'jeudis', repo: newRepo(), signedIn: false);
    await tester.tap(find.text('Créer un compte'));
    await tester.pumpAndSettle();
    expect(find.text('page-signup'), findsOneWidget);
  });
}
