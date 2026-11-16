import 'package:freezed_annotation/freezed_annotation.dart';

part 'outing_idea.freezed.dart';

/// Idée de sortie proposée pour le week-end.
@freezed
abstract class OutingIdea with _$OutingIdea {
  const factory OutingIdea({
    required String id,
    required String title,
    required String category,
    required int priceEuros,
    required int travelMinutes,
  }) = _OutingIdea;
}
