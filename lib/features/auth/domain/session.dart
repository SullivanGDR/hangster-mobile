import 'package:freezed_annotation/freezed_annotation.dart';

import 'auth_user.dart';

part 'session.freezed.dart';

/// Session ouverte (le jeton reste du ressort de la couche data).
@freezed
abstract class Session with _$Session {
  const factory Session({required AuthUser user}) = _Session;
}
