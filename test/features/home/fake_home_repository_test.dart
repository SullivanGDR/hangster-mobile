import 'package:flutter_test/flutter_test.dart';
import 'package:hangster_mobile/core/errors/api_failure.dart';
import 'package:hangster_mobile/features/home/data/fake_home_repository.dart';
import 'package:hangster_mobile/features/home/domain/todo_item.dart';

void main() {
  final now = DateTime(2026, 11, 16, 20);

  test('données réalistes relatives à maintenant', () async {
    final repo = FakeHomeRepository(clock: () => now, latency: Duration.zero);
    final o = await repo.overview();
    final outing = o.nextOuting!;
    expect(outing.placeName, 'Le Phare Bleu');
    expect(outing.groupName, 'Les Jeudis');
    expect(outing.startsAt, DateTime(2026, 11, 20, 20, 30));
    expect((outing.confirmedCount, outing.totalCount), (4, 6));
    expect(o.todos.map((t) => t.type), [TodoType.vote]);
    expect(o.freeFriends, hasLength(3));
    expect(o.ideas.map((i) => i.title), [
      'Ping Club Oberkampf',
      'Guinguette du Canal',
    ]);
    expect(o.isEmpty, isFalse);
  });

  test('scénario vide', () async {
    final repo = FakeHomeRepository(
      latency: Duration.zero,
      scenario: FakeHomeScenario.empty,
    );
    expect((await repo.overview()).isEmpty, isTrue);
  });

  test('scénario erreur', () async {
    final repo = FakeHomeRepository(
      latency: Duration.zero,
      scenario: FakeHomeScenario.error,
    );
    await expectLater(repo.overview(), throwsA(isA<ApiFailure>()));
  });
}
