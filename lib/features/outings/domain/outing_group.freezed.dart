// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outing_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OutingGroup {

 String get id; String get name; int get memberCount;
/// Create a copy of OutingGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutingGroupCopyWith<OutingGroup> get copyWith => _$OutingGroupCopyWithImpl<OutingGroup>(this as OutingGroup, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OutingGroup;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutingGroup&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.memberCount, _this.memberCount) || other.memberCount == _this.memberCount));
}


@override
int get hashCode {
  final _this = this as OutingGroup;
  return Object.hash(runtimeType,_this.id,_this.name,_this.memberCount);
}

@override
String toString() {
  final _this = this as OutingGroup;
  return 'OutingGroup(id: ${_this.id}, name: ${_this.name}, memberCount: ${_this.memberCount})';
}


}

/// @nodoc
abstract mixin class $OutingGroupCopyWith<$Res>  {
  factory $OutingGroupCopyWith(OutingGroup value, $Res Function(OutingGroup) _then) = _$OutingGroupCopyWithImpl;
@useResult
$Res call({
 String id, String name, int memberCount
});




}
/// @nodoc
class _$OutingGroupCopyWithImpl<$Res>
    implements $OutingGroupCopyWith<$Res> {
  _$OutingGroupCopyWithImpl(this._self, this._then);

  final OutingGroup _self;
  final $Res Function(OutingGroup) _then;

/// Create a copy of OutingGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? memberCount = null,}) {
  return _then(OutingGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OutingGroup].
extension OutingGroupPatterns on OutingGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutingGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutingGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutingGroup value)  $default,){
final _that = this;
switch (_that) {
case _OutingGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutingGroup value)?  $default,){
final _that = this;
switch (_that) {
case _OutingGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int memberCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutingGroup() when $default != null:
return $default(_that.id,_that.name,_that.memberCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int memberCount)  $default,) {final _that = this;
switch (_that) {
case _OutingGroup():
return $default(_that.id,_that.name,_that.memberCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int memberCount)?  $default,) {final _that = this;
switch (_that) {
case _OutingGroup() when $default != null:
return $default(_that.id,_that.name,_that.memberCount);case _:
  return null;

}
}

}

/// @nodoc


class _OutingGroup implements OutingGroup {
  const _OutingGroup({required this.id, required this.name, required this.memberCount});
  

@override final  String id;
@override final  String name;
@override final  int memberCount;

/// Create a copy of OutingGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutingGroupCopyWith<_OutingGroup> get copyWith => __$OutingGroupCopyWithImpl<_OutingGroup>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutingGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,memberCount);
}

@override
String toString() {
    return 'OutingGroup(id: $id, name: $name, memberCount: $memberCount)';
}


}

/// @nodoc
abstract mixin class _$OutingGroupCopyWith<$Res> implements $OutingGroupCopyWith<$Res> {
  factory _$OutingGroupCopyWith(_OutingGroup value, $Res Function(_OutingGroup) _then) = __$OutingGroupCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int memberCount
});




}
/// @nodoc
class __$OutingGroupCopyWithImpl<$Res>
    implements _$OutingGroupCopyWith<$Res> {
  __$OutingGroupCopyWithImpl(this._self, this._then);

  final _OutingGroup _self;
  final $Res Function(_OutingGroup) _then;

/// Create a copy of OutingGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? memberCount = null,}) {
  return _then(_OutingGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
