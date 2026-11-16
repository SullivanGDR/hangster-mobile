import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hangster_mobile/app/app.dart';
import 'package:hangster_mobile/app/router/app_router.dart';
import 'package:hangster_mobile/core/errors/api_failure.dart';
import 'package:hangster_mobile/features/auth/data/fake_auth_repository.dart';
import 'package:hangster_mobile/features/auth/domain/session.dart';
import 'package:hangster_mobile/features/auth/presentation/auth_providers.dart';
import 'package:hangster_mobile/shared/widgets/sun_loader.dart';

class _NetworkDownRepository extends FakeAuthRepository {
  _NetworkDownRepository() : super(latency: Duration.zero);

  @override
  Future<Session> signIn({required String email, required String password}) =>
      Future<Session>.error(const ApiNetwork());
}

/// Lance l'app (360 dp) et renvoie une fonction donnant l'URL courante.
Future<String Function()> _pump(
  WidgetTester tester, {
  FakeAuthRepository? repo,
  String? start,
}) async {
  tester.view.physicalSize = const Size(360, 800);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        authRepositoryProvider.overrideWithValue(
          repo ?? FakeAuthRepository(latency: Duration.zero),
        ),
      ],
      child: const HangsterApp(),
    ),
  );
  await tester.pumpAndSettle();
  final c = ProviderScope.containerOf(tester.element(find.byType(HangsterApp)));
  final router = c.read(routerProvider);
  if (start != null) {
    router.go(start);
    await tester.pumpAndSettle();
  }
  return () => router.routeInformationProvider.value.uri.toString();
}

Finder _field(String label) => find.widgetWithText(TextFormField, label);

Future<void> _fillLogin(WidgetTester tester, String password) async {
  await tester.enterText(_field('Adresse e-mail'), 'camille@example.com');
  await tester.enterText(_field('Mot de passe'), password);
  await tester.tap(find.text('Se connecter').first);
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('connexion : validation e-mail et mot de passe', (tester) async {
    await _pump(tester);
    await tester.enterText(_field('Adresse e-mail'), 'pas-un-email');
    await tester.enterText(_field('Mot de passe'), 'court');
    await tester.tap(find.text('Se connecter').first);
    await tester.pumpAndSettle();
    expect(find.text('Saisissez une adresse e-mail valide.'), findsOneWidget);
    expect(find.textContaining('au moins 8 caractères'), findsOneWidget);
  });

  testWidgets('connexion : succes redirige vers accueil', (tester) async {
    final loc = await _pump(tester);
    await _fillLogin(tester, 'motdepasse123');
    expect(loc(), '/');
    expect(find.text('Connexion'), findsNothing);
  });

  testWidgets('connexion : identifiants incorrects', (tester) async {
    await _pump(tester);
    await _fillLogin(tester, 'mauvaismotdepasse');
    expect(find.text('E-mail ou mot de passe incorrect.'), findsOneWidget);
  });

  testWidgets('connexion : probleme reseau', (tester) async {
    await _pump(tester, repo: _NetworkDownRepository());
    await _fillLogin(tester, 'motdepasse123');
    expect(find.textContaining('Problème de connexion'), findsOneWidget);
  });

  testWidgets('connexion : SunLoader pendant la requete', (tester) async {
    await _pump(
      tester,
      repo: FakeAuthRepository(latency: const Duration(seconds: 1)),
    );
    await tester.enterText(_field('Adresse e-mail'), 'camille@example.com');
    await tester.enterText(_field('Mot de passe'), 'motdepasse123');
    await tester.tap(find.text('Se connecter').first);
    await tester.pump();
    expect(find.byType(SunLoader), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
  });

  testWidgets('inscription : validation du nom', (tester) async {
    await _pump(tester, start: AppRoutes.signup);
    await tester.tap(find.text('Créer mon compte'));
    await tester.pumpAndSettle();
    expect(find.text('Saisissez votre nom.'), findsOneWidget);
  });

  testWidgets('inscription : e-mail deja utilise', (tester) async {
    await _pump(tester, start: AppRoutes.signup);
    await tester.enterText(_field('Nom affiché'), 'Camille');
    await tester.enterText(_field('Adresse e-mail'), 'camille@example.com');
    await tester.enterText(_field('Mot de passe'), 'motdepasse123');
    await tester.tap(find.text('Créer mon compte'));
    await tester.pumpAndSettle();
    expect(
      find.text('Cette adresse e-mail est déjà utilisée.'),
      findsOneWidget,
    );
  });

  testWidgets('inscription : succes redirige vers /onboarding avec from', (
    tester,
  ) async {
    final loc = await _pump(
      tester,
      start: '${AppRoutes.signup}?from=%2Fi%2Fabc',
    );
    await tester.enterText(_field('Nom affiché'), 'Sacha');
    await tester.enterText(_field('Adresse e-mail'), 'sacha@example.com');
    await tester.enterText(_field('Mot de passe'), 'motdepasse123');
    await tester.tap(find.text('Créer mon compte'));
    await tester.pumpAndSettle();
    expect(loc(), '/onboarding?from=%2Fi%2Fabc');
  });

  testWidgets('liens entre connexion et inscription', (tester) async {
    await _pump(tester);
    await tester.tap(find.text('Créer un compte'));
    await tester.pumpAndSettle();
    expect(find.text('Inscription'), findsOneWidget);
    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();
    expect(find.text('Connexion'), findsOneWidget);
  });

  group('garde et parametre from', () {
    testWidgets('from valide', (tester) async {
      final loc = await _pump(
        tester,
        start: '${AppRoutes.login}?from=%2Fgroups',
      );
      await _fillLogin(tester, 'motdepasse123');
      expect(loc(), '/groups');
    });

    testWidgets('from invalide (//evil.com)', (tester) async {
      final loc = await _pump(
        tester,
        start: '${AppRoutes.login}?from=%2F%2Fevil.com',
      );
      await _fillLogin(tester, 'motdepasse123');
      expect(loc(), '/');
    });

    testWidgets('from absent', (tester) async {
      final loc = await _pump(tester, start: AppRoutes.login);
      await _fillLogin(tester, 'motdepasse123');
      expect(loc(), '/');
    });
  });
}
