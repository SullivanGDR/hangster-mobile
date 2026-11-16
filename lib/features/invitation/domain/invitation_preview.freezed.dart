// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InvitationPreview {

 String get code; String get groupName; int get memberCount; bool get openVote;
/// Create a copy of InvitationPreview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvitationPreviewCopyWith<InvitationPreview> get copyWith => _$InvitationPreviewCopyWithImpl<InvitationPreview>(this as InvitationPreview, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as InvitationPreview;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvitationPreview&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.groupName, _this.groupName) || other.groupName == _this.groupName)&&(identical(other.memberCount, _this.memberCount) || other.memberCount == _this.memberCount)&&(identical(other.openVote, _this.openVote) || other.openVote == _this.openVote));
}


@override
int get hashCode {
  final _this = this as InvitationPreview;
  return Object.hash(runtimeType,_this.code,_this.groupName,_this.memberCount,_this.openVote);
}

@override
String toString() {
  final _this = this as InvitationPreview;
  return 'InvitationPreview(code: ${_this.code}, groupName: ${_this.groupName}, memberCount: ${_this.memberCount}, openVote: ${_this.openVote})';
}


}

/// @nodoc
abstract mixin class $InvitationPreviewCopyWith<$Res>  {
  factory $InvitationPreviewCopyWith(InvitationPreview value, $Res Function(InvitationPreview) _then) = _$InvitationPreviewCopyWithImpl;
@useResult
$Res call({
 String code, String groupName, int memberCount, bool openVote
});




}
/// @nodoc
class _$InvitationPreviewCopyWithImpl<$Res>
    implements $InvitationPreviewCopyWith<$Res> {
  _$InvitationPreviewCopyWithImpl(this._self, this._then);

  final InvitationPreview _self;
  final $Res Function(InvitationPreview) _then;

/// Create a copy of InvitationPreview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? groupName = null,Object? memberCount = null,Object? openVote = null,}) {
  return _then(InvitationPreview(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,openVote: null == openVote ? _self.openVote : openVote // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [InvitationPreview].
extension InvitationPreviewPatterns on InvitationPreview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvitationPreview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvitationPreview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvitationPreview value)  $default,){
final _that = this;
switch (_that) {
case _InvitationPreview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvitationPreview value)?  $default,){
final _that = this;
switch (_that) {
case _InvitationPreview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String groupName,  int memberCount,  bool openVote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvitationPreview() when $default != null:
return $default(_that.code,_that.groupName,_that.memberCount,_that.openVote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String groupName,  int memberCount,  bool openVote)  $default,) {final _that = this;
switch (_that) {
case _InvitationPreview():
return $default(_that.code,_that.groupName,_that.memberCount,_that.openVote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String groupName,  int memberCount,  bool openVote)?  $default,) {final _that = this;
switch (_that) {
case _InvitationPreview() when $default != null:
return $default(_that.code,_that.groupName,_that.memberCount,_that.openVote);case _:
  return null;

}
}

}

/// @nodoc


class _InvitationPreview implements InvitationPreview {
  const _InvitationPreview({required this.code, required this.groupName, required this.memberCount, required this.openVote});
  

@override final  String code;
@override final  String groupName;
@override final  int memberCount;
@override final  bool openVote;

/// Create a copy of InvitationPreview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvitationPreviewCopyWith<_InvitationPreview> get copyWith => __$InvitationPreviewCopyWithImpl<_InvitationPreview>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvitationPreview&&(identical(other.code, code) || other.code == code)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount)&&(identical(other.openVote, openVote) || other.openVote == openVote));
}


@override
int get hashCode {
    return Object.hash(runtimeType,code,groupName,memberCount,openVote);
}

@override
String toString() {
    return 'InvitationPreview(code: $code, groupName: $groupName, memberCount: $memberCount, openVote: $openVote)';
}


}

/// @nodoc
abstract mixin class _$InvitationPreviewCopyWith<$Res> implements $InvitationPreviewCopyWith<$Res> {
  factory _$InvitationPreviewCopyWith(_InvitationPreview value, $Res Function(_InvitationPreview) _then) = __$InvitationPreviewCopyWithImpl;
@override @useResult
$Res call({
 String code, String groupName, int memberCount, bool openVote
});




}
/// @nodoc
class __$InvitationPreviewCopyWithImpl<$Res>
    implements _$InvitationPreviewCopyWith<$Res> {
  __$InvitationPreviewCopyWithImpl(this._self, this._then);

  final _InvitationPreview _self;
  final $Res Function(_InvitationPreview) _then;

/// Create a copy of InvitationPreview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? groupName = null,Object? memberCount = null,Object? openVote = null,}) {
  return _then(_InvitationPreview(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,openVote: null == openVote ? _self.openVote : openVote // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
