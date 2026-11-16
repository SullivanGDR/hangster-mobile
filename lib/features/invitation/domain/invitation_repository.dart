import 'invitation_preview.dart';

abstract interface class InvitationRepository {
  /// Leve `ApiNotFound` si le code est inconnu.
  Future<InvitationPreview> preview(String code);
  Future<void> join(String code);
}
