import 'package:cupertino_ui/cupertino_ui.dart'
    show GlobalCupertinoLocalizations;
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalWidgetsLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hangster_mobile/app/theme/app_theme.dart';
import 'package:hangster_mobile/features/auth/presentation/auth_providers.dart';
import 'package:hangster_mobile/features/onboarding/data/fake_preferences_repository.dart';
import 'package:hangster_mobile/features/onboarding/domain/taste_preferences.dart';
import 'package:hangster_mobile/features/onboarding/presentation/onboarding_screen.dart';
import 'package:hangster_mobile/l10n/generated/app_localizations.dart';
import 'package:material_ui/material_ui.dart';

Future<FakePreferencesRepository> _pump(
  WidgetTester tester, {
  String location = '/onboarding',
}) async {
  tester.view.physicalSize = const Size(800, 2400);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  final repo = FakePreferencesRepository(latency: Duration.zero);
  final router = GoRouter(
    initialLocation: location,
    routes: [
      GoRoute(path: '/onboarding', builder: (_, _) => const OnboardingScreen()),
      GoRoute(path: '/', builder: (_, _) => const Text('page-home')),
      GoRoute(path: '/i/:code', builder: (_, _) => const Text('page-invite')),
    ],
  );
  addTearDown(router.dispose);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [preferencesRepositoryProvider.overrideWithValue(repo)],
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
  return repo;
}

bool _enabled(WidgetTester tester, String label) => tester
    .widget<FilledButton>(find.widgetWithText(FilledButton, label))
    .enabled;

Future<void> _toZoneStep(WidgetTester tester) async {
  await tester.tap(find.text('Bars'));
  await tester.pump();
  await tester.tap(find.text('Continuer'));
  await tester.pumpAndSettle();
  await tester.tap(find.text('15 à 30 €'));
  await tester.pump();
  await tester.tap(find.text('Continuer'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('parcourt les trois étapes et enregistre', (tester) async {
    final repo = await _pump(tester);
    expect(find.text('Étape 1 sur 3'), findsOneWidget);
    expect(_enabled(tester, 'Continuer'), isFalse);

    await tester.tap(find.text('Bars'));
    await tester.tap(find.text('Karaoké'));
    await tester.pump();
    expect(_enabled(tester, 'Continuer'), isTrue);
    await tester.tap(find.text('Continuer'));
    await tester.pumpAndSettle();

    expect(find.text('Étape 2 sur 3'), findsOneWidget);
    await tester.tap(find.text('15 à 30 €'));
    await tester.pump();
    await tester.tap(find.text('Continuer'));
    await tester.pumpAndSettle();

    expect(find.text('Étape 3 sur 3'), findsOneWidget);
    expect(_enabled(tester, 'Terminer'), isFalse);
    await tester.tap(find.text('Lyon centre'));
    await tester.pump();
    await tester.tap(find.text('Terminer'));
    await tester.pumpAndSettle();

    final saved = (await tester.runAsync(repo.load))!;
    expect(saved.categories, {OutingCategory.bars, OutingCategory.karaoke});
    expect(saved.budget, BudgetRange.from15to30);
    expect(saved.zone?.label, 'Lyon centre');
    expect(find.text('page-home'), findsOneWidget);
  });

  testWidgets('retour conserve la sélection', (tester) async {
    await _pump(tester);
    await tester.tap(find.text('Bars'));
    await tester.pump();
    await tester.tap(find.text('Continuer'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Retour'));
    await tester.pumpAndSettle();
    expect(find.text('Étape 1 sur 3'), findsOneWidget);
    expect(_enabled(tester, 'Continuer'), isTrue);
  });

  testWidgets('passer la zone enregistre sans zone, from respecté', (
    tester,
  ) async {
    final repo = await _pump(tester, location: '/onboarding?from=/i/jeudis');
    await _toZoneStep(tester);
    await tester.tap(find.text('Passer cette étape'));
    await tester.pumpAndSettle();

    final saved = (await tester.runAsync(repo.load))!;
    expect(saved.zone, isNull);
    expect(saved.budget, BudgetRange.from15to30);
    expect(find.text('page-invite'), findsOneWidget);
  });

  testWidgets("from invalide : retour à l'accueil", (tester) async {
    await _pump(tester, location: '/onboarding?from=//evil.com');
    await _toZoneStep(tester);
    await tester.tap(find.text('Passer cette étape'));
    await tester.pumpAndSettle();
    expect(find.text('page-home'), findsOneWidget);
  });
}
