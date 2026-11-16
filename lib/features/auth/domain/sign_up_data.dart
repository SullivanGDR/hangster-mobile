import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_data.freezed.dart';

/// Donnees saisies a l'inscription.
@freezed
abstract class SignUpData with _$SignUpData {
  const factory SignUpData({
    required String email,
    required String password,
    required String displayName,
  }) = _SignUpData;
}
