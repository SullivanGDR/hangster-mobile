import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';

enum TodoType { vote, availability }

/// Action attendue de l'utilisateur sur l'accueil.
@freezed
abstract class TodoItem with _$TodoItem {
  const factory TodoItem({
    required String id,
    required TodoType type,
    required String groupName,
    DateTime? dueAt,

    /// Jour de la sortie concernée (pour « Voter pour vendredi »).
    DateTime? targetDate,
  }) = _TodoItem;
}
