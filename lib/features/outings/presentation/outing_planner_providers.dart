import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../onboarding/domain/taste_preferences.dart';
import '../data/fake_outing_planner_repository.dart';
import '../domain/outing_criteria.dart';
import '../domain/outing_draft.dart';
import '../domain/outing_group.dart';
import '../domain/outing_planner_repository.dart';
import '../domain/place_proposal.dart';
import '../domain/time_slot.dart';

part 'outing_planner_providers.g.dart';

// Fake branché ici tant que l'API n'existe pas.
@Riverpod(keepAlive: true)
OutingPlannerRepository outingPlannerRepository(Ref ref) =>
    FakeOutingPlannerRepository();

Duration? _noRetry(int retryCount, Object error) => null;

@Riverpod(retry: _noRetry)
Future<List<OutingGroup>> outingGroups(Ref ref) =>
    ref.read(outingPlannerRepositoryProvider).groups();

/// Créneaux du groupe sélectionné dans le brouillon (vide sans groupe).
@Riverpod(retry: _noRetry)
Future<List<TimeSlot>> outingSlots(Ref ref) {
  final group = ref.watch(outingDraftControllerProvider.select((d) => d.group));
  if (group == null) return Future.value(const []);
  return ref.read(outingPlannerRepositoryProvider).slots(group.id);
}

/// Étiquettes détectées dans l'envie du brouillon.
@Riverpod(retry: _noRetry)
Future<List<String>> outingWishTags(Ref ref) {
  final wish = ref.watch(outingDraftControllerProvider.select((d) => d.wish));
  return ref.read(outingPlannerRepositoryProvider).interpretWish(wish);
}

/// Propositions pour le brouillon courant.
@Riverpod(retry: _noRetry)
Future<List<PlaceProposal>> outingProposals(Ref ref) {
  final draft = ref.watch(outingDraftControllerProvider);
  return ref.read(outingPlannerRepositoryProvider).proposals(draft);
}

/// Choix de l'utilisateur, gardés entre les deux écrans.
@Riverpod(keepAlive: true)
class OutingDraftController extends _$OutingDraftController {
  @override
  OutingDraft build() => const OutingDraft();

  /// Changer de groupe invalide le créneau choisi.
  void selectGroup(OutingGroup group) {
    if (state.group?.id == group.id) return;
    state = state.copyWith(group: group, slot: null);
  }

  void selectSlot(TimeSlot slot) => state = state.copyWith(slot: slot);

  void setWish(String wish) => state = state.copyWith(wish: wish);

  void setCriteria(OutingCriteria criteria) =>
      state = state.copyWith(criteria: criteria);

  void setBudget(BudgetRange budget) =>
      state = state.copyWith(criteria: state.criteria.copyWith(budget: budget));

  void setMaxTravelMinutes(int minutes) => state = state.copyWith(
    criteria: state.criteria.copyWith(maxTravelMinutes: minutes),
  );

  void reset() => state = const OutingDraft();
}
