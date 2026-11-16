import 'package:cupertino_ui/cupertino_ui.dart'
    show GlobalCupertinoLocalizations;
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalWidgetsLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hangster_mobile/app/theme/app_theme.dart';
import 'package:hangster_mobile/core/clock/clock.dart';
import 'package:hangster_mobile/features/home/data/fake_home_repository.dart';
import 'package:hangster_mobile/features/home/presentation/home_providers.dart';
import 'package:hangster_mobile/features/home/presentation/home_screen.dart';
import 'package:hangster_mobile/l10n/generated/app_localizations.dart';
import 'package:hangster_mobile/shared/widgets/sun_loader.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../support/signed_in.dart';

Future<void> _pump(
  WidgetTester tester, {
  required FakeHomeRepository repo,
  required DateTime Function() clock,
  Size size = const Size(360, 800),
  double textScale = 1,
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (_, _) => const HomeScreen()),
      GoRoute(path: '/outings', builder: (_, _) => const Text('page-outings')),
      GoRoute(
        path: '/outings/new',
        builder: (_, _) => const Text('page-new-outing'),
      ),
    ],
  );
  addTearDown(router.dispose);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        ...signedInOverrides(),
        clockProvider.overrideWithValue(clock),
        homeRepositoryProvider.overrideWithValue(repo),
      ],
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
}

void main() {
  final now = DateTime(2026, 11, 16, 20);
  FakeHomeRepository repo([FakeHomeScenario s = FakeHomeScenario.filled]) =>
      FakeHomeRepository(clock: () => now, latency: Duration.zero, scenario: s);

  testWidgets('données : en-tête, sortie, amis libres, à faire, idées', (
    tester,
  ) async {
    final semantics = tester.ensureSemantics();
    await _pump(tester, repo: repo(), clock: () => now);
    await tester.pumpAndSettle();
    expect(find.text('Lundi 16 novembre'), findsOneWidget);
    expect(find.text('Bonsoir Camille'), findsOneWidget);
    expect(find.bySemanticsLabel('Notifications, 2 nouvelles'), findsOneWidget);
    expect(find.text('Prochaine sortie · Les Jeudis'), findsOneWidget);
    expect(find.text('Le Phare Bleu'), findsOneWidget);
    expect(find.text('Vendredi 20 · 20 h 30'), findsOneWidget);
    expect(find.text('J-4'), findsOneWidget);
    expect(find.text('4 sur 6 viennent'), findsOneWidget);
    expect(find.text('3 amis libres ce soir'), findsOneWidget);
    expect(find.text('Inès, Malik et Chloé'), findsOneWidget);
    expect(find.text('À faire'), findsOneWidget);
    expect(find.text('Voter pour jeudi'), findsOneWidget);
    expect(find.text("Coloc' · clôture dans 5 h"), findsOneWidget);
    expect(find.text('Voter'), findsOneWidget);
    expect(find.text('Idées pour ce week-end'), findsOneWidget);
    expect(find.text('Jeux · 12 € · 10 min'), findsOneWidget);
    expect(tester.takeException(), isNull);
    semantics.dispose();
  });

  testWidgets('la carte À faire mène vers /outings', (tester) async {
    await _pump(tester, repo: repo(), clock: () => now);
    await tester.pumpAndSettle();
    final row = find.text('Voter pour jeudi');
    await tester.ensureVisible(row);
    await tester.tap(row);
    await tester.pumpAndSettle();
    expect(find.text('page-outings'), findsOneWidget);
  });

  testWidgets('le compte à rebours dit Ce soir et Demain', (tester) async {
    final tonight = DateTime(2026, 11, 20, 19);
    await _pump(tester, repo: repo(), clock: () => tonight);
    await tester.pumpAndSettle();
    expect(find.text('Ce soir'), findsOneWidget);
    final tomorrow = DateTime(2026, 11, 19, 10);
    await _pump(tester, repo: repo(), clock: () => tomorrow);
    await tester.pumpAndSettle();
    expect(find.text('Demain'), findsOneWidget);
  });

  testWidgets('cloche et cartes cliquables >= 48 dp', (tester) async {
    await _pump(tester, repo: repo(), clock: () => now);
    await tester.pumpAndSettle();
    for (final finder in [
      find.ancestor(
        of: find.byIcon(LucideIcons.bell),
        matching: find.byType(InkResponse),
      ),
      find.ancestor(of: find.text('Voter'), matching: find.byType(InkWell)),
    ]) {
      final size = tester.getSize(finder.first);
      expect(size.width, greaterThanOrEqualTo(48));
      expect(size.height, greaterThanOrEqualTo(48));
    }
  });

  testWidgets('petit écran et texte agrandi sans débordement', (tester) async {
    await _pump(tester, repo: repo(), clock: () => now, textScale: 2);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  testWidgets('grand écran sans débordement', (tester) async {
    await _pump(
      tester,
      repo: repo(),
      clock: () => now,
      size: const Size(1200, 900),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  testWidgets('vide : message et action vers /outings/new', (tester) async {
    await _pump(tester, repo: repo(FakeHomeScenario.empty), clock: () => now);
    await tester.pumpAndSettle();
    expect(find.text('Aucune sortie en vue'), findsOneWidget);
    await tester.tap(find.text('Nouvelle sortie'));
    await tester.pumpAndSettle();
    expect(find.text('page-new-outing'), findsOneWidget);
  });

  testWidgets('erreur : message puis Réessayer', (tester) async {
    final r = repo(FakeHomeScenario.error);
    await _pump(tester, repo: r, clock: () => now);
    await tester.pumpAndSettle();
    expect(find.text('Impossible de charger votre accueil.'), findsOneWidget);
    r.scenario = FakeHomeScenario.filled;
    await tester.tap(find.text('Réessayer'));
    await tester.pumpAndSettle();
    expect(find.text('Bonsoir Camille'), findsOneWidget);
  });

  testWidgets('chargement : SunLoader', (tester) async {
    await _pump(
      tester,
      repo: FakeHomeRepository(
        clock: () => now,
        latency: const Duration(milliseconds: 400),
      ),
      clock: () => now,
    );
    await tester.pump();
    expect(find.byType(SunLoader), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump();
    expect(find.byType(SunLoader), findsNothing);
  });
}
