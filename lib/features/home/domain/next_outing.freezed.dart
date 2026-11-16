// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'next_outing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NextOuting {

 String get id; String get title; String get placeName; String get groupName; DateTime get startsAt; int get confirmedCount; int get totalCount; List<String> get attendeeInitials;
/// Create a copy of NextOuting
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NextOutingCopyWith<NextOuting> get copyWith => _$NextOutingCopyWithImpl<NextOuting>(this as NextOuting, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NextOuting;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextOuting&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.placeName, _this.placeName) || other.placeName == _this.placeName)&&(identical(other.groupName, _this.groupName) || other.groupName == _this.groupName)&&(identical(other.startsAt, _this.startsAt) || other.startsAt == _this.startsAt)&&(identical(other.confirmedCount, _this.confirmedCount) || other.confirmedCount == _this.confirmedCount)&&(identical(other.totalCount, _this.totalCount) || other.totalCount == _this.totalCount)&&const DeepCollectionEquality().equals(other.attendeeInitials, _this.attendeeInitials));
}


@override
int get hashCode {
  final _this = this as NextOuting;
  return Object.hash(runtimeType,_this.id,_this.title,_this.placeName,_this.groupName,_this.startsAt,_this.confirmedCount,_this.totalCount,const DeepCollectionEquality().hash(_this.attendeeInitials));
}

@override
String toString() {
  final _this = this as NextOuting;
  return 'NextOuting(id: ${_this.id}, title: ${_this.title}, placeName: ${_this.placeName}, groupName: ${_this.groupName}, startsAt: ${_this.startsAt}, confirmedCount: ${_this.confirmedCount}, totalCount: ${_this.totalCount}, attendeeInitials: ${_this.attendeeInitials})';
}


}

/// @nodoc
abstract mixin class $NextOutingCopyWith<$Res>  {
  factory $NextOutingCopyWith(NextOuting value, $Res Function(NextOuting) _then) = _$NextOutingCopyWithImpl;
@useResult
$Res call({
 String id, String title, String placeName, String groupName, DateTime startsAt, int confirmedCount, int totalCount, List<String> attendeeInitials
});




}
/// @nodoc
class _$NextOutingCopyWithImpl<$Res>
    implements $NextOutingCopyWith<$Res> {
  _$NextOutingCopyWithImpl(this._self, this._then);

  final NextOuting _self;
  final $Res Function(NextOuting) _then;

/// Create a copy of NextOuting
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? placeName = null,Object? groupName = null,Object? startsAt = null,Object? confirmedCount = null,Object? totalCount = null,Object? attendeeInitials = null,}) {
  return _then(NextOuting(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,placeName: null == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,confirmedCount: null == confirmedCount ? _self.confirmedCount : confirmedCount // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,attendeeInitials: null == attendeeInitials ? _self.attendeeInitials : attendeeInitials // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [NextOuting].
extension NextOutingPatterns on NextOuting {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NextOuting value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NextOuting() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NextOuting value)  $default,){
final _that = this;
switch (_that) {
case _NextOuting():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NextOuting value)?  $default,){
final _that = this;
switch (_that) {
case _NextOuting() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String placeName,  String groupName,  DateTime startsAt,  int confirmedCount,  int totalCount,  List<String> attendeeInitials)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NextOuting() when $default != null:
return $default(_that.id,_that.title,_that.placeName,_that.groupName,_that.startsAt,_that.confirmedCount,_that.totalCount,_that.attendeeInitials);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String placeName,  String groupName,  DateTime startsAt,  int confirmedCount,  int totalCount,  List<String> attendeeInitials)  $default,) {final _that = this;
switch (_that) {
case _NextOuting():
return $default(_that.id,_that.title,_that.placeName,_that.groupName,_that.startsAt,_that.confirmedCount,_that.totalCount,_that.attendeeInitials);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String placeName,  String groupName,  DateTime startsAt,  int confirmedCount,  int totalCount,  List<String> attendeeInitials)?  $default,) {final _that = this;
switch (_that) {
case _NextOuting() when $default != null:
return $default(_that.id,_that.title,_that.placeName,_that.groupName,_that.startsAt,_that.confirmedCount,_that.totalCount,_that.attendeeInitials);case _:
  return null;

}
}

}

/// @nodoc


class _NextOuting implements NextOuting {
  const _NextOuting({required this.id, required this.title, required this.placeName, required this.groupName, required this.startsAt, required this.confirmedCount, required this.totalCount,  List<String> attendeeInitials = const <String>[]}): _attendeeInitials = attendeeInitials;
  

@override final  String id;
@override final  String title;
@override final  String placeName;
@override final  String groupName;
@override final  DateTime startsAt;
@override final  int confirmedCount;
@override final  int totalCount;
 final  List<String> _attendeeInitials;
@override@JsonKey() List<String> get attendeeInitials {
  if (_attendeeInitials is EqualUnmodifiableListView) return _attendeeInitials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attendeeInitials);
}


/// Create a copy of NextOuting
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NextOutingCopyWith<_NextOuting> get copyWith => __$NextOutingCopyWithImpl<_NextOuting>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextOuting&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.placeName, placeName) || other.placeName == placeName)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.confirmedCount, confirmedCount) || other.confirmedCount == confirmedCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other.attendeeInitials, _attendeeInitials));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,placeName,groupName,startsAt,confirmedCount,totalCount,const DeepCollectionEquality().hash(_attendeeInitials));
}

@override
String toString() {
    return 'NextOuting(id: $id, title: $title, placeName: $placeName, groupName: $groupName, startsAt: $startsAt, confirmedCount: $confirmedCount, totalCount: $totalCount, attendeeInitials: $attendeeInitials)';
}


}

/// @nodoc
abstract mixin class _$NextOutingCopyWith<$Res> implements $NextOutingCopyWith<$Res> {
  factory _$NextOutingCopyWith(_NextOuting value, $Res Function(_NextOuting) _then) = __$NextOutingCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String placeName, String groupName, DateTime startsAt, int confirmedCount, int totalCount, List<String> attendeeInitials
});




}
/// @nodoc
class __$NextOutingCopyWithImpl<$Res>
    implements _$NextOutingCopyWith<$Res> {
  __$NextOutingCopyWithImpl(this._self, this._then);

  final _NextOuting _self;
  final $Res Function(_NextOuting) _then;

/// Create a copy of NextOuting
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? placeName = null,Object? groupName = null,Object? startsAt = null,Object? confirmedCount = null,Object? totalCount = null,Object? attendeeInitials = null,}) {
  return _then(_NextOuting(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,placeName: null == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,confirmedCount: null == confirmedCount ? _self.confirmedCount : confirmedCount // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,attendeeInitials: null == attendeeInitials ? _self._attendeeInitials : attendeeInitials // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
