import 'package:freezed_annotation/freezed_annotation.dart';

import 'outing_criteria.dart';
import 'outing_group.dart';
import 'time_slot.dart';

part 'outing_draft.freezed.dart';

/// Brouillon de sortie, conservé entre les deux étapes.
@freezed
abstract class OutingDraft with _$OutingDraft {
  const factory OutingDraft({
    OutingGroup? group,
    TimeSlot? slot,
    @Default('') String wish,
    @Default(OutingCriteria()) OutingCriteria criteria,
  }) = _OutingDraft;
}
