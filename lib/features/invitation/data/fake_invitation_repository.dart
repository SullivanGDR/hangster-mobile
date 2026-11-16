import '../../../core/errors/api_failure.dart';
import '../domain/invitation_preview.dart';
import '../domain/invitation_repository.dart';

class FakeInvitationRepository implements InvitationRepository {
  FakeInvitationRepository({this.latency = const Duration(milliseconds: 400)});

  final Duration latency;
  final Set<String> joined = {};

  static const Map<String, InvitationPreview> _known = {
    'jeudis': InvitationPreview(
      code: 'jeudis',
      groupName: 'Les Jeudis',
      memberCount: 6,
      openVote: true,
    ),
  };

  InvitationPreview _find(String code) {
    final found = _known[code.trim().toLowerCase()];
    if (found == null) throw const ApiNotFound(title: 'Unknown invitation');
    return found;
  }

  @override
  Future<InvitationPreview> preview(String code) async {
    await Future<void>.delayed(latency);
    return _find(code);
  }

  @override
  Future<void> join(String code) async {
    await Future<void>.delayed(latency);
    joined.add(_find(code).code);
  }
}
