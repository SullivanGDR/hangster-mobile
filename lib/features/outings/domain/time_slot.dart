import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_slot.freezed.dart';

/// Créneau proposé, avec le nombre de membres libres.
@freezed
abstract class TimeSlot with _$TimeSlot {
  const TimeSlot._();

  const factory TimeSlot({
    required DateTime start,
    required String label,
    required int freeCount,
    required int totalCount,
  }) = _TimeSlot;

  bool get everyoneFree => freeCount >= totalCount;
}
