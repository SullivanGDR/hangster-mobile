import 'package:flutter_test/flutter_test.dart';
import 'package:hangster_mobile/core/errors/api_failure.dart';
import 'package:hangster_mobile/features/invitation/data/fake_invitation_repository.dart';

void main() {
  FakeInvitationRepository repo() =>
      FakeInvitationRepository(latency: Duration.zero);

  test('preview et join sur un code connu', () async {
    final r = repo();
    final p = await r.preview('JEUDIS');
    expect(p.groupName, 'Les Jeudis');
    expect(p.memberCount, 6);
    expect(p.openVote, isTrue);
    await r.join('jeudis');
    expect(r.joined, contains('jeudis'));
  });

  test('code inconnu -> ApiNotFound', () {
    expect(repo().preview('zzz'), throwsA(isA<ApiNotFound>()));
    expect(repo().join('zzz'), throwsA(isA<ApiNotFound>()));
  });
}
