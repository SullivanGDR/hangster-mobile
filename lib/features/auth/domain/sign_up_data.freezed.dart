// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignUpData {

 String get email; String get password; String get displayName;
/// Create a copy of SignUpData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpDataCopyWith<SignUpData> get copyWith => _$SignUpDataCopyWithImpl<SignUpData>(this as SignUpData, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SignUpData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpData&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.password, _this.password) || other.password == _this.password)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName));
}


@override
int get hashCode {
  final _this = this as SignUpData;
  return Object.hash(runtimeType,_this.email,_this.password,_this.displayName);
}

@override
String toString() {
  final _this = this as SignUpData;
  return 'SignUpData(email: ${_this.email}, password: ${_this.password}, displayName: ${_this.displayName})';
}


}

/// @nodoc
abstract mixin class $SignUpDataCopyWith<$Res>  {
  factory $SignUpDataCopyWith(SignUpData value, $Res Function(SignUpData) _then) = _$SignUpDataCopyWithImpl;
@useResult
$Res call({
 String email, String password, String displayName
});




}
/// @nodoc
class _$SignUpDataCopyWithImpl<$Res>
    implements $SignUpDataCopyWith<$Res> {
  _$SignUpDataCopyWithImpl(this._self, this._then);

  final SignUpData _self;
  final $Res Function(SignUpData) _then;

/// Create a copy of SignUpData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? displayName = null,}) {
  return _then(SignUpData(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpData].
extension SignUpDataPatterns on SignUpData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpData value)  $default,){
final _that = this;
switch (_that) {
case _SignUpData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpData value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password,  String displayName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpData() when $default != null:
return $default(_that.email,_that.password,_that.displayName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password,  String displayName)  $default,) {final _that = this;
switch (_that) {
case _SignUpData():
return $default(_that.email,_that.password,_that.displayName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password,  String displayName)?  $default,) {final _that = this;
switch (_that) {
case _SignUpData() when $default != null:
return $default(_that.email,_that.password,_that.displayName);case _:
  return null;

}
}

}

/// @nodoc


class _SignUpData implements SignUpData {
  const _SignUpData({required this.email, required this.password, required this.displayName});
  

@override final  String email;
@override final  String password;
@override final  String displayName;

/// Create a copy of SignUpData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpDataCopyWith<_SignUpData> get copyWith => __$SignUpDataCopyWithImpl<_SignUpData>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpData&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}


@override
int get hashCode {
    return Object.hash(runtimeType,email,password,displayName);
}

@override
String toString() {
    return 'SignUpData(email: $email, password: $password, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class _$SignUpDataCopyWith<$Res> implements $SignUpDataCopyWith<$Res> {
  factory _$SignUpDataCopyWith(_SignUpData value, $Res Function(_SignUpData) _then) = __$SignUpDataCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String displayName
});




}
/// @nodoc
class __$SignUpDataCopyWithImpl<$Res>
    implements _$SignUpDataCopyWith<$Res> {
  __$SignUpDataCopyWithImpl(this._self, this._then);

  final _SignUpData _self;
  final $Res Function(_SignUpData) _then;

/// Create a copy of SignUpData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? displayName = null,}) {
  return _then(_SignUpData(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
