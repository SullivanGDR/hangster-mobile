import 'package:freezed_annotation/freezed_annotation.dart';

part 'next_outing.freezed.dart';

/// Prochaine sortie confirmée du groupe.
@freezed
abstract class NextOuting with _$NextOuting {
  const factory NextOuting({
    required String id,
    required String title,
    required String placeName,
    required String groupName,
    required DateTime startsAt,
    required int confirmedCount,
    required int totalCount,
    @Default(<String>[]) List<String> attendeeInitials,
  }) = _NextOuting;
}
