import '../../../core/clock/clock.dart';
import '../../../core/errors/api_failure.dart';
import '../../onboarding/domain/taste_preferences.dart';
import '../domain/outing_criteria.dart';
import '../domain/outing_draft.dart';
import '../domain/outing_group.dart';
import '../domain/outing_planner_repository.dart';
import '../domain/place_proposal.dart';
import '../domain/time_slot.dart';

enum FakeOutingPlannerScenario { normal, noProposals, error }

class FakeOutingPlannerRepository implements OutingPlannerRepository {
  FakeOutingPlannerRepository({
    Clock? clock,
    this.scenario = FakeOutingPlannerScenario.normal,
    this.latency = const Duration(milliseconds: 400),
  }) : _clock = clock ?? DateTime.now;

  final Clock _clock;
  final Duration latency;

  /// Modifiable pour simuler l'absence de propositions ou une erreur.
  FakeOutingPlannerScenario scenario;

  static const _groups = [
    OutingGroup(id: 'g1', name: 'Les Jeudis', memberCount: 6),
    OutingGroup(id: 'g2', name: "Coloc'", memberCount: 4),
    OutingGroup(id: 'g3', name: 'Équipe foot', memberCount: 9),
  ];

  static const _places = [
    PlaceProposal(
      id: 'p1',
      name: 'Le Phare Bleu',
      category: OutingCategory.bars,
      priceEuros: 18,
      durationMinutes: 150,
      minTravelMinutes: 8,
      maxTravelMinutes: 22,
    ),
    PlaceProposal(
      id: 'p2',
      name: 'Quiz du Mardi',
      category: OutingCategory.games,
      priceEuros: 8,
      durationMinutes: 120,
      minTravelMinutes: 12,
      maxTravelMinutes: 18,
    ),
    PlaceProposal(
      id: 'p3',
      name: 'Chez Mirabelle',
      category: OutingCategory.restaurants,
      priceEuros: 32,
      durationMinutes: 120,
      minTravelMinutes: 5,
      maxTravelMinutes: 35,
    ),
    PlaceProposal(
      id: 'p4',
      name: 'Ping Club Oberkampf',
      category: OutingCategory.games,
      priceEuros: 12,
      durationMinutes: 90,
      minTravelMinutes: 10,
      maxTravelMinutes: 26,
    ),
    PlaceProposal(
      id: 'p5',
      name: 'Karaoké Le Micro',
      category: OutingCategory.karaoke,
      priceEuros: 25,
      durationMinutes: 120,
      minTravelMinutes: 15,
      maxTravelMinutes: 28,
    ),
    PlaceProposal(
      id: 'p6',
      name: 'Table des Halles',
      category: OutingCategory.restaurants,
      priceEuros: 58,
      durationMinutes: 150,
      minTravelMinutes: 9,
      maxTravelMinutes: 16,
    ),
  ];

  Future<void> _wait() async {
    await Future<void>.delayed(latency);
    if (scenario == FakeOutingPlannerScenario.error) throw const ApiNetwork();
  }

  @override
  Future<List<OutingGroup>> groups() async {
    await _wait();
    return _groups;
  }

  @override
  Future<List<TimeSlot>> slots(String groupId) async {
    await _wait();
    final total = _groups
        .firstWhere((g) => g.id == groupId, orElse: () => _groups.first)
        .memberCount;
    final now = _clock();
    DateTime at(int days, int hour) =>
        DateTime(now.year, now.month, now.day + days, hour);
    final slots = [
      TimeSlot(
        start: at(1, 20),
        label: 'Soirée',
        freeCount: total - 2,
        totalCount: total,
      ),
      TimeSlot(
        start: at(3, 20),
        label: 'Soirée',
        freeCount: total,
        totalCount: total,
      ),
      TimeSlot(
        start: at(5, 14),
        label: 'Après-midi',
        freeCount: total - 1,
        totalCount: total,
      ),
      TimeSlot(
        start: at(5, 20),
        label: 'Soirée',
        freeCount: total,
        totalCount: total,
      ),
      TimeSlot(
        start: at(6, 12),
        label: 'Déjeuner',
        freeCount: total - 3,
        totalCount: total,
      ),
    ];
    // Tout le monde libre d'abord, puis par date.
    slots.sort((a, b) {
      if (a.everyoneFree != b.everyoneFree) return a.everyoneFree ? -1 : 1;
      return a.start.compareTo(b.start);
    });
    return slots;
  }

  @override
  Future<List<String>> interpretWish(String text) async {
    await _wait();
    final t = text.toLowerCase();
    final tags = <String>[];
    void add(List<String> keys, String tag) {
      if (keys.any(t.contains)) tags.add(tag);
    }

    add(['discuter', 'parler', 'calme', 'tranquille'], 'Pour discuter');
    add(['jeu', 'jouer', 'ping', 'quiz'], 'Jeux');
    add(['manger', 'resto', 'dîner', 'diner'], 'Repas');
    add(['verre', 'bar', 'boire'], 'Verre');
    add(['chanter', 'karaoké', 'karaoke'], 'Karaoké');
    add(['dehors', 'terrasse', 'plein air'], 'Plein air');
    final hugo = RegExp(r'hugo\D*(\d{1,3})').firstMatch(t);
    if (hugo != null) tags.add('Hugo ≤ ${hugo.group(1)} min');
    return tags;
  }

  @override
  Future<List<PlaceProposal>> proposals(OutingDraft draft) async {
    await _wait();
    if (scenario == FakeOutingPlannerScenario.noProposals) return const [];
    final maxPrice = draft.criteria.budget.maxEuros;
    final result = _places
        .where(
          (p) =>
              (maxPrice == null || p.priceEuros <= maxPrice) &&
              p.longestTravelMinutes <= draft.criteria.maxTravelMinutes,
        )
        .toList();
    // On réduit le trajet le plus long, pas la moyenne.
    result.sort((a, b) {
      final c = a.longestTravelMinutes.compareTo(b.longestTravelMinutes);
      return c != 0 ? c : a.priceEuros.compareTo(b.priceEuros);
    });
    return result;
  }
}
