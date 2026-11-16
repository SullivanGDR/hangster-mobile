import 'package:freezed_annotation/freezed_annotation.dart';

part 'outing_group.freezed.dart';

/// Groupe pour lequel on organise une sortie.
@freezed
abstract class OutingGroup with _$OutingGroup {
  const factory OutingGroup({
    required String id,
    required String name,
    required int memberCount,
  }) = _OutingGroup;
}
