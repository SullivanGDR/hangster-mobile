import '../../../core/clock/clock.dart';
import '../../../core/errors/api_failure.dart';
import '../domain/free_friend.dart';
import '../domain/home_overview.dart';
import '../domain/home_repository.dart';
import '../domain/next_outing.dart';
import '../domain/outing_idea.dart';
import '../domain/todo_item.dart';

enum FakeHomeScenario { filled, empty, error }

class FakeHomeRepository implements HomeRepository {
  FakeHomeRepository({
    Clock? clock,
    this.scenario = FakeHomeScenario.filled,
    this.latency = const Duration(milliseconds: 400),
  }) : _clock = clock ?? DateTime.now;

  final Clock _clock;
  final Duration latency;

  /// Modifiable pour simuler une liste vide ou une erreur.
  FakeHomeScenario scenario;

  @override
  Future<HomeOverview> overview() async {
    await Future<void>.delayed(latency);
    switch (scenario) {
      case FakeHomeScenario.error:
        throw const ApiNetwork();
      case FakeHomeScenario.empty:
        return const HomeOverview();
      case FakeHomeScenario.filled:
        return _filled(_clock());
    }
  }

  HomeOverview _filled(DateTime now) {
    final inFourDays = now.add(const Duration(days: 4));
    return HomeOverview(
      nextOuting: NextOuting(
        id: 'o1',
        title: 'Soirée du jeudi',
        placeName: 'Le Phare Bleu',
        groupName: 'Les Jeudis',
        startsAt: DateTime(
          inFourDays.year,
          inFourDays.month,
          inFourDays.day,
          20,
          30,
        ),
        confirmedCount: 4,
        totalCount: 6,
        attendeeInitials: const ['LÉ', 'HU', 'IN'],
      ),
      todos: [
        TodoItem(
          id: 't1',
          type: TodoType.vote,
          groupName: "Coloc'",
          dueAt: now.add(const Duration(hours: 5)),
          targetDate: now.add(const Duration(days: 3)),
        ),
      ],
      freeFriends: const [
        FreeFriend(id: 'f1', firstName: 'Inès'),
        FreeFriend(id: 'f2', firstName: 'Malik'),
        FreeFriend(id: 'f3', firstName: 'Chloé'),
      ],
      ideas: const [
        OutingIdea(
          id: 'i1',
          title: 'Ping Club Oberkampf',
          category: 'Jeux',
          priceEuros: 12,
          travelMinutes: 10,
        ),
        OutingIdea(
          id: 'i2',
          title: 'Guinguette du Canal',
          category: 'Plein air',
          priceEuros: 10,
          travelMinutes: 14,
        ),
      ],
      unreadNotifications: 2,
    );
  }
}
