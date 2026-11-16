import 'outing_draft.dart';
import 'outing_group.dart';
import 'place_proposal.dart';
import 'time_slot.dart';

abstract interface class OutingPlannerRepository {
  Future<List<OutingGroup>> groups();

  /// Créneaux triés : ceux où tout le monde est libre en premier.
  Future<List<TimeSlot>> slots(String groupId);

  /// Étiquettes de critères détectées dans l'envie en texte libre.
  Future<List<String>> interpretWish(String text);

  /// Propositions classées par trajet le plus long croissant.
  /// Liste vide si rien ne correspond.
  Future<List<PlaceProposal>> proposals(OutingDraft draft);
}
