import 'package:freezed_annotation/freezed_annotation.dart';

import 'free_friend.dart';
import 'next_outing.dart';
import 'outing_idea.dart';
import 'todo_item.dart';

part 'home_overview.freezed.dart';

/// Contenu de l'écran d'accueil.
@freezed
abstract class HomeOverview with _$HomeOverview {
  const factory HomeOverview({
    NextOuting? nextOuting,
    @Default(<TodoItem>[]) List<TodoItem> todos,
    @Default(<FreeFriend>[]) List<FreeFriend> freeFriends,
    @Default(<OutingIdea>[]) List<OutingIdea> ideas,
    @Default(0) int unreadNotifications,
  }) = _HomeOverview;

  const HomeOverview._();

  /// Rien à montrer : ni sortie à venir, ni action attendue.
  bool get isEmpty => nextOuting == null && todos.isEmpty;
}
