import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation_preview.freezed.dart';

@freezed
abstract class InvitationPreview with _$InvitationPreview {
  const factory InvitationPreview({
    required String code,
    required String groupName,
    required int memberCount,
    required bool openVote,
  }) = _InvitationPreview;
}
