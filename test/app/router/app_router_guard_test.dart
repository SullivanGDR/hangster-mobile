import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hangster_mobile/app/app.dart';
import 'package:hangster_mobile/app/router/app_router.dart';
import 'package:hangster_mobile/features/auth/data/fake_auth_repository.dart';
import 'package:hangster_mobile/features/auth/domain/auth_user.dart';
import 'package:hangster_mobile/features/auth/domain/session.dart';
import 'package:hangster_mobile/features/auth/presentation/auth_providers.dart';

const _session = Session(
  user: AuthUser(
    id: 'u1',
    email: 'camille@example.com',
    displayName: 'Camille',
  ),
);

Future<ProviderContainer> _pump(WidgetTester tester, {Session? session}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        authRepositoryProvider.overrideWithValue(
          FakeAuthRepository(initialSession: session, latency: Duration.zero),
        ),
      ],
      child: const HangsterApp(),
    ),
  );
  await tester.pumpAndSettle();
  return ProviderScope.containerOf(tester.element(find.byType(HangsterApp)));
}

void main() {
  testWidgets('non connecte -> ecran de connexion', (tester) async {
    await _pump(tester);
    expect(find.text('Connexion'), findsOneWidget);
    expect(find.text('Accueil'), findsNothing);
  });

  testWidgets('connecte -> accueil', (tester) async {
    await _pump(tester, session: _session);
    expect(find.text('Connexion'), findsNothing);
    expect(find.text('Accueil'), findsWidgets);
  });

  testWidgets('connecte sur /login -> redirige vers accueil', (tester) async {
    final c = await _pump(tester, session: _session);
    c.read(routerProvider).go(AppRoutes.login);
    await tester.pumpAndSettle();
    expect(find.text('Connexion'), findsNothing);
    expect(find.text('Accueil'), findsWidgets);
  });

  testWidgets('la deconnexion renvoie vers /login', (tester) async {
    final c = await _pump(tester, session: _session);
    final done = c.read(authControllerProvider.notifier).signOut();
    await tester.pumpAndSettle();
    await done;
    await tester.pumpAndSettle();
    expect(find.text('Connexion'), findsOneWidget);
  });

  testWidgets('/i/:code reste accessible sans connexion', (tester) async {
    final c = await _pump(tester);
    c.read(routerProvider).go(AppRoutes.invitation('jeudis'));
    await tester.pumpAndSettle();
    expect(find.text('Les Jeudis'), findsOneWidget);
  });
}
