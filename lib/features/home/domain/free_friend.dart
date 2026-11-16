import 'package:freezed_annotation/freezed_annotation.dart';

part 'free_friend.freezed.dart';

/// Ami libre ce soir.
@freezed
abstract class FreeFriend with _$FreeFriend {
  const factory FreeFriend({required String id, required String firstName}) =
      _FreeFriend;
}
