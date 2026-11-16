import 'dart:async';

import 'package:cupertino_ui/cupertino_ui.dart'
    show GlobalCupertinoLocalizations;
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalWidgetsLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hangster_mobile/app/theme/app_theme.dart';
import 'package:hangster_mobile/features/outings/data/fake_outing_planner_repository.dart';
import 'package:hangster_mobile/features/outings/presentation/new_outing_screen.dart';
import 'package:hangster_mobile/features/outings/presentation/outing_planner_providers.dart';
import 'package:hangster_mobile/l10n/generated/app_localizations.dart';
import 'package:material_ui/material_ui.dart';

late ProviderContainer _container;

Future<void> _pump(
  WidgetTester tester, {
  FakeOutingPlannerScenario scenario = FakeOutingPlannerScenario.normal,
  Size size = const Size(360, 800),
  double textScale = 1,
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  final router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(path: '/home', builder: (_, _) => const Text('page-home')),
      GoRoute(path: '/outings/new', builder: (_, _) => const NewOutingScreen()),
      GoRoute(
        path: '/outings/new/proposals',
        builder: (_, _) => const Text('page-proposals'),
      ),
    ],
  );
  addTearDown(router.dispose);
  _container = ProviderContainer(
    overrides: [
      outingPlannerRepositoryProvider.overrideWithValue(
        FakeOutingPlannerRepository(scenario: scenario, latency: Duration.zero),
      ),
    ],
  );
  addTearDown(_container.dispose);
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: _container,
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
  unawaited(router.push('/outings/new'));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 50));
  await tester.pump(const Duration(milliseconds: 50));
}

Finder _cta() => find.widgetWithText(FilledButton, 'Trouver des lieux');

void main() {
  testWidgets('bouton désactivé puis actif après groupe et créneau', (
    tester,
  ) async {
    await _pump(tester);
    expect(tester.widget<FilledButton>(_cta()).onPressed, isNull);

    await tester.tap(find.text('Les Jeudis · 6'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));
    expect(tester.widget<FilledButton>(_cta()).onPressed, isNull);
    expect(find.text('6 sur 6'), findsWidgets);

    await tester.tap(find.text('6 sur 6').first);
    await tester.pump();
    expect(tester.widget<FilledButton>(_cta()).onPressed, isNotNull);

    await tester.tap(_cta());
    await tester.pumpAndSettle();
    expect(find.text('page-proposals'), findsOneWidget);
  });

  testWidgets('sélection du groupe annoncée', (tester) async {
    await _pump(tester);
    final handle = tester.ensureSemantics();
    await tester.ensureVisible(find.text("Coloc' · 4"));
    await tester.tap(find.text("Coloc' · 4"));
    await tester.pump();
    expect(
      tester.getSemantics(find.text("Coloc' · 4")),
      isSemantics(label: "Coloc' · 4", isButton: true, isSelected: true),
    );
    expect(_container.read(outingDraftControllerProvider).group?.id, 'g2');
    await tester.pumpAndSettle();
    handle.dispose();
  });

  testWidgets('critères budget et trajet', (tester) async {
    await _pump(tester);
    await tester.ensureVisible(find.text('45 min'));
    await tester.tap(find.text('45 min'));
    await tester.ensureVisible(find.text('Plus de 50 €'));
    await tester.tap(find.text('Plus de 50 €'));
    final c = _container.read(outingDraftControllerProvider).criteria;
    expect(c.maxTravelMinutes, 45);
    expect(c.budget.name, 'over50');
  });

  testWidgets('étiquettes détectées dans l\'envie', (tester) async {
    await _pump(tester);
    await tester.enterText(find.byType(TextField), 'Un endroit pour discuter');
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));
    expect(
      _container.read(outingDraftControllerProvider).wish,
      'Un endroit pour discuter',
    );
    final tags = await _container.read(outingWishTagsProvider.future);
    expect(tags, isNotEmpty);
    expect(find.text(tags.first), findsOneWidget);
  });

  testWidgets('fermer remet le brouillon à zéro et revient', (tester) async {
    await _pump(tester);
    await tester.tap(find.text('Les Jeudis · 6'));
    await tester.pump();
    await tester.tap(find.bySemanticsLabel('Fermer'));
    await tester.pumpAndSettle();
    expect(find.text('page-home'), findsOneWidget);
    expect(_container.read(outingDraftControllerProvider).group, isNull);
  });

  testWidgets('erreur de chargement avec Réessayer', (tester) async {
    await _pump(tester, scenario: FakeOutingPlannerScenario.error);
    expect(find.text('Réessayer'), findsOneWidget);
    expect(tester.widget<FilledButton>(_cta()).onPressed, isNull);
  });

  testWidgets('texte agrandi sur petit écran sans débordement', (tester) async {
    await _pump(tester, textScale: 2);
    await tester.ensureVisible(find.text('Les Jeudis · 6'));
    await tester.pump();
    await tester.tap(find.text('Les Jeudis · 6'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));
    expect(tester.takeException(), isNull);
  });
}
