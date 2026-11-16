import 'package:cupertino_ui/cupertino_ui.dart'
    show GlobalCupertinoLocalizations;
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalWidgetsLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hangster_mobile/app/theme/app_theme.dart';
import 'package:hangster_mobile/features/outings/data/fake_outing_planner_repository.dart';
import 'package:hangster_mobile/features/outings/presentation/outing_planner_providers.dart';
import 'package:hangster_mobile/features/outings/presentation/proposals_screen.dart';
import 'package:hangster_mobile/l10n/generated/app_localizations.dart';
import 'package:hangster_mobile/shared/widgets/sun_loader.dart';
import 'package:material_ui/material_ui.dart';

Future<ProviderContainer> _pump(
  WidgetTester tester, {
  FakeOutingPlannerScenario scenario = FakeOutingPlannerScenario.normal,
  Duration latency = Duration.zero,
  Size size = const Size(360, 800),
  double textScale = 1,
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  final repo = FakeOutingPlannerRepository(
    clock: () => DateTime(2026, 11, 16, 20),
    latency: latency,
    scenario: scenario,
  );
  final router = GoRouter(
    initialLocation: '/outings/new/proposals',
    routes: [
      GoRoute(path: '/', builder: (_, _) => const Text('page-home')),
      GoRoute(
        path: '/outings/new',
        builder: (_, _) => const Text('page-new-outing'),
        routes: [
          GoRoute(
            path: 'proposals',
            builder: (_, _) => const ProposalsScreen(),
          ),
        ],
      ),
    ],
  );
  addTearDown(router.dispose);
  final container = ProviderContainer(
    overrides: [outingPlannerRepositoryProvider.overrideWithValue(repo)],
  );
  addTearDown(container.dispose);
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
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
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!,
        ),
        routerConfig: router,
      ),
    ),
  );
  await tester.pumpAndSettle();
  return container;
}

Finder get _submit => find.widgetWithText(FilledButton, 'Proposer au groupe');

void main() {
  testWidgets('liste, bouton désactivé puis actif après sélection', (
    tester,
  ) async {
    await _pump(tester);
    expect(find.text('Étape 2 sur 2'), findsOneWidget);
    expect(
      find.textContaining('trajet le plus long reste court'),
      findsOneWidget,
    );
    expect(find.textContaining('pour tous'), findsWidgets);
    expect(tester.widget<FilledButton>(_submit).onPressed, isNull);

    await tester.tap(find.text('Quiz du Mardi'));
    await tester.pump();
    expect(tester.widget<FilledButton>(_submit).onPressed, isNotNull);
    expect(
      tester.getSemantics(find.bySemanticsLabel('Choisir Quiz du Mardi')),
      isSemantics(hasCheckedState: true, isChecked: true),
    );
  });

  testWidgets('sélection unique : un seul choix à la fois', (tester) async {
    await _pump(tester);
    final all = find.byWidgetPredicate(
      (w) =>
          w is Semantics &&
          w.properties.inMutuallyExclusiveGroup == true &&
          w.properties.checked == true,
    );
    await tester.tap(find.text('Quiz du Mardi'));
    await tester.pump();
    expect(all, findsOneWidget);
    await tester.ensureVisible(find.text('Le Phare Bleu'));
    await tester.pump();
    await tester.tap(find.text('Le Phare Bleu'));
    await tester.pump();
    expect(all, findsOneWidget);
  });

  testWidgets('envoyer revient à l\'accueil et remet le brouillon à zéro', (
    tester,
  ) async {
    final container = await _pump(tester);
    container.read(outingDraftControllerProvider.notifier).setWish('bar');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Quiz du Mardi'));
    await tester.pump();
    await tester.tap(_submit);
    await tester.pumpAndSettle();
    expect(find.text('page-home'), findsOneWidget);
    expect(container.read(outingDraftControllerProvider).wish, isEmpty);
  });

  testWidgets('chargement : SunLoader tant que les lieux arrivent', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final repo = FakeOutingPlannerRepository(
      latency: const Duration(seconds: 1),
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [outingPlannerRepositoryProvider.overrideWithValue(repo)],
        child: MaterialApp(
          theme: AppTheme.light(),
          locale: const Locale('fr'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: const ProposalsScreen(),
        ),
      ),
    );
    await tester.pump();
    expect(find.byType(SunLoader), findsOneWidget);
    expect(_submit, findsNothing);
    await tester.pump(const Duration(seconds: 2));
    expect(find.byType(SunLoader), findsNothing);
    expect(find.text('Quiz du Mardi'), findsOneWidget);
  });

  testWidgets('liste vide : message et retour sur les critères', (
    tester,
  ) async {
    await _pump(tester, scenario: FakeOutingPlannerScenario.noProposals);
    expect(find.text('Aucun lieu ne convient'), findsOneWidget);
    expect(_submit, findsNothing);
    await tester.tap(find.text('Modifier mes critères'));
    await tester.pumpAndSettle();
    expect(find.text('page-new-outing'), findsOneWidget);
  });

  testWidgets('erreur puis réessai', (tester) async {
    final container = await _pump(
      tester,
      scenario: FakeOutingPlannerScenario.error,
    );
    expect(find.text('Impossible de charger les propositions.'), findsOne);
    (container.read(
          outingPlannerRepositoryProvider,
        ) as FakeOutingPlannerRepository).scenario =
        FakeOutingPlannerScenario.normal;
    await tester.tap(find.text('Réessayer'));
    await tester.pumpAndSettle();
    expect(find.text('Quiz du Mardi'), findsOneWidget);
  });

  testWidgets('retour : revient à l\'écran précédent', (tester) async {
    await _pump(tester);
    await tester.tap(find.bySemanticsLabel('Retour'));
    await tester.pumpAndSettle();
    expect(find.text('page-new-outing'), findsOneWidget);
  });

  testWidgets(
    'cibles >= 48 dp, texte agrandi et grand écran sans débordement',
    (tester) async {
      await _pump(tester, textScale: 2);
      expect(tester.takeException(), isNull);
      final back = tester.getSize(find.bySemanticsLabel('Retour'));
      expect(back.height, greaterThanOrEqualTo(48));
      expect(back.width, greaterThanOrEqualTo(48));
      final card = tester.getSize(
        find.bySemanticsLabel('Choisir Quiz du Mardi'),
      );
      expect(card.height, greaterThanOrEqualTo(48));
      await _pump(tester, size: const Size(1200, 900));
      expect(tester.takeException(), isNull);
    },
  );
}
