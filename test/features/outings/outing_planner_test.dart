import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hangster_mobile/core/errors/api_failure.dart';
import 'package:hangster_mobile/features/onboarding/domain/taste_preferences.dart';
import 'package:hangster_mobile/features/outings/data/fake_outing_planner_repository.dart';
import 'package:hangster_mobile/features/outings/domain/outing_criteria.dart';
import 'package:hangster_mobile/features/outings/domain/outing_draft.dart';
import 'package:hangster_mobile/features/outings/presentation/outing_planner_providers.dart';

void main() {
  final now = DateTime(2026, 11, 16, 20);
  FakeOutingPlannerRepository repo([
    FakeOutingPlannerScenario s = FakeOutingPlannerScenario.normal,
  ]) => FakeOutingPlannerRepository(
    clock: () => now,
    latency: Duration.zero,
    scenario: s,
  );

  OutingDraft draft(BudgetRange b, int travel) => OutingDraft(
    criteria: OutingCriteria(budget: b, maxTravelMinutes: travel),
  );

  test('groupes', () async {
    final g = await repo().groups();
    expect(g.map((e) => e.name), ['Les Jeudis', "Coloc'", 'Équipe foot']);
    expect(g.map((e) => e.memberCount), [6, 4, 9]);
  });

  test('créneaux : tout le monde libre en premier, puis par date', () async {
    final s = await repo().slots('g1');
    final flags = s.map((e) => e.everyoneFree).toList();
    expect(flags.indexOf(false), greaterThanOrEqualTo(flags.lastIndexOf(true)));
    expect(s.first.everyoneFree, isTrue);
    expect(s.first.start.isAfter(now), isTrue);
    expect(s.first.totalCount, 6);
    final free = s.where((e) => e.everyoneFree).toList();
    expect(free.first.start.isBefore(free.last.start), isTrue);
  });

  test('classement par trajet le plus long', () async {
    final p = await repo().proposals(draft(BudgetRange.over50, 60));
    final longest = p.map((e) => e.longestTravelMinutes).toList();
    expect(longest, [...longest]..sort());
    expect(p.first.name, 'Table des Halles');
    expect(p.last.name, 'Chez Mirabelle');
  });

  test('filtre budget', () async {
    final p = await repo().proposals(draft(BudgetRange.under15, 60));
    expect(p.map((e) => e.name), ['Quiz du Mardi', 'Ping Club Oberkampf']);
    expect(p.every((e) => e.priceEuros <= 15), isTrue);
  });

  test('filtre trajet max', () async {
    final p = await repo().proposals(draft(BudgetRange.over50, 20));
    expect(p.map((e) => e.name), ['Table des Halles', 'Quiz du Mardi']);
  });

  test('aucun résultat', () async {
    expect(await repo().proposals(draft(BudgetRange.under15, 5)), isEmpty);
    final none = repo(FakeOutingPlannerScenario.noProposals);
    expect(await none.proposals(draft(BudgetRange.over50, 60)), isEmpty);
  });

  test('scénario erreur', () async {
    await expectLater(
      repo(FakeOutingPlannerScenario.error).groups(),
      throwsA(isA<ApiFailure>()),
    );
  });

  test('interpretWish', () async {
    final tags = await repo().interpretWish(
      'Un endroit calme pour discuter, un jeu, Hugo à 20 min max',
    );
    expect(tags, containsAll(['Pour discuter', 'Jeux', 'Hugo ≤ 20 min']));
    expect(await repo().interpretWish(''), isEmpty);
  });

  group('OutingDraftController', () {
    test(
      'garde les choix, invalide le créneau au changement de groupe, reset',
      () async {
        final c = ProviderContainer(
          overrides: [
            outingPlannerRepositoryProvider.overrideWithValue(repo()),
          ],
        );
        addTearDown(c.dispose);
        final groups = await c.read(outingGroupsProvider.future);
        final ctrl = c.read(outingDraftControllerProvider.notifier)
          ..selectGroup(groups.first);
        final slots = await c.read(outingSlotsProvider.future);
        expect(slots, isNotEmpty);
        ctrl
          ..selectSlot(slots.first)
          ..setWish('un verre')
          ..setBudget(BudgetRange.under15)
          ..setMaxTravelMinutes(15);
        var d = c.read(outingDraftControllerProvider);
        expect(d.slot, slots.first);
        expect(d.wish, 'un verre');
        expect(d.criteria.maxTravelMinutes, 15);
        ctrl.selectGroup(groups[1]);
        d = c.read(outingDraftControllerProvider);
        expect(d.slot, isNull);
        expect(d.wish, 'un verre');
        ctrl.reset();
        expect(c.read(outingDraftControllerProvider), const OutingDraft());
      },
    );
  });
}
