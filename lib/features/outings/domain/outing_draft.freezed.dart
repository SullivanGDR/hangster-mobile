// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outing_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OutingDraft {

 OutingGroup? get group; TimeSlot? get slot; String get wish; OutingCriteria get criteria;
/// Create a copy of OutingDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutingDraftCopyWith<OutingDraft> get copyWith => _$OutingDraftCopyWithImpl<OutingDraft>(this as OutingDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OutingDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutingDraft&&(identical(other.group, _this.group) || other.group == _this.group)&&(identical(other.slot, _this.slot) || other.slot == _this.slot)&&(identical(other.wish, _this.wish) || other.wish == _this.wish)&&(identical(other.criteria, _this.criteria) || other.criteria == _this.criteria));
}


@override
int get hashCode {
  final _this = this as OutingDraft;
  return Object.hash(runtimeType,_this.group,_this.slot,_this.wish,_this.criteria);
}

@override
String toString() {
  final _this = this as OutingDraft;
  return 'OutingDraft(group: ${_this.group}, slot: ${_this.slot}, wish: ${_this.wish}, criteria: ${_this.criteria})';
}


}

/// @nodoc
abstract mixin class $OutingDraftCopyWith<$Res>  {
  factory $OutingDraftCopyWith(OutingDraft value, $Res Function(OutingDraft) _then) = _$OutingDraftCopyWithImpl;
@useResult
$Res call({
 OutingGroup? group, TimeSlot? slot, String wish, OutingCriteria criteria
});


$OutingGroupCopyWith<$Res>? get group;$TimeSlotCopyWith<$Res>? get slot;$OutingCriteriaCopyWith<$Res> get criteria;

}
/// @nodoc
class _$OutingDraftCopyWithImpl<$Res>
    implements $OutingDraftCopyWith<$Res> {
  _$OutingDraftCopyWithImpl(this._self, this._then);

  final OutingDraft _self;
  final $Res Function(OutingDraft) _then;

/// Create a copy of OutingDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? group = freezed,Object? slot = freezed,Object? wish = null,Object? criteria = null,}) {
  return _then(OutingDraft(
group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as OutingGroup?,slot: freezed == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as TimeSlot?,wish: null == wish ? _self.wish : wish // ignore: cast_nullable_to_non_nullable
as String,criteria: null == criteria ? _self.criteria : criteria // ignore: cast_nullable_to_non_nullable
as OutingCriteria,
  ));
}
/// Create a copy of OutingDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutingGroupCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $OutingGroupCopyWith<$Res>(_self.group!, (value) {
    return _then(_self.copyWith(group: value));
  });
}/// Create a copy of OutingDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeSlotCopyWith<$Res>? get slot {
    if (_self.slot == null) {
    return null;
  }

  return $TimeSlotCopyWith<$Res>(_self.slot!, (value) {
    return _then(_self.copyWith(slot: value));
  });
}/// Create a copy of OutingDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutingCriteriaCopyWith<$Res> get criteria {
  
  return $OutingCriteriaCopyWith<$Res>(_self.criteria, (value) {
    return _then(_self.copyWith(criteria: value));
  });
}
}


/// Adds pattern-matching-related methods to [OutingDraft].
extension OutingDraftPatterns on OutingDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutingDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutingDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutingDraft value)  $default,){
final _that = this;
switch (_that) {
case _OutingDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutingDraft value)?  $default,){
final _that = this;
switch (_that) {
case _OutingDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OutingGroup? group,  TimeSlot? slot,  String wish,  OutingCriteria criteria)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutingDraft() when $default != null:
return $default(_that.group,_that.slot,_that.wish,_that.criteria);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OutingGroup? group,  TimeSlot? slot,  String wish,  OutingCriteria criteria)  $default,) {final _that = this;
switch (_that) {
case _OutingDraft():
return $default(_that.group,_that.slot,_that.wish,_that.criteria);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OutingGroup? group,  TimeSlot? slot,  String wish,  OutingCriteria criteria)?  $default,) {final _that = this;
switch (_that) {
case _OutingDraft() when $default != null:
return $default(_that.group,_that.slot,_that.wish,_that.criteria);case _:
  return null;

}
}

}

/// @nodoc


class _OutingDraft implements OutingDraft {
  const _OutingDraft({this.group, this.slot, this.wish = '', this.criteria = const OutingCriteria()});
  

@override final  OutingGroup? group;
@override final  TimeSlot? slot;
@override@JsonKey() final  String wish;
@override@JsonKey() final  OutingCriteria criteria;

/// Create a copy of OutingDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutingDraftCopyWith<_OutingDraft> get copyWith => __$OutingDraftCopyWithImpl<_OutingDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutingDraft&&(identical(other.group, group) || other.group == group)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.wish, wish) || other.wish == wish)&&(identical(other.criteria, criteria) || other.criteria == criteria));
}


@override
int get hashCode {
    return Object.hash(runtimeType,group,slot,wish,criteria);
}

@override
String toString() {
    return 'OutingDraft(group: $group, slot: $slot, wish: $wish, criteria: $criteria)';
}


}

/// @nodoc
abstract mixin class _$OutingDraftCopyWith<$Res> implements $OutingDraftCopyWith<$Res> {
  factory _$OutingDraftCopyWith(_OutingDraft value, $Res Function(_OutingDraft) _then) = __$OutingDraftCopyWithImpl;
@override @useResult
$Res call({
 OutingGroup? group, TimeSlot? slot, String wish, OutingCriteria criteria
});


@override $OutingGroupCopyWith<$Res>? get group;@override $TimeSlotCopyWith<$Res>? get slot;@override $OutingCriteriaCopyWith<$Res> get criteria;

}
/// @nodoc
class __$OutingDraftCopyWithImpl<$Res>
    implements _$OutingDraftCopyWith<$Res> {
  __$OutingDraftCopyWithImpl(this._self, this._then);

  final _OutingDraft _self;
  final $Res Function(_OutingDraft) _then;

/// Create a copy of OutingDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? group = freezed,Object? slot = freezed,Object? wish = null,Object? criteria = null,}) {
  return _then(_OutingDraft(
group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as OutingGroup?,slot: freezed == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as TimeSlot?,wish: null == wish ? _self.wish : wish // ignore: cast_nullable_to_non_nullable
as String,criteria: null == criteria ? _self.criteria : criteria // ignore: cast_nullable_to_non_nullable
as OutingCriteria,
  ));
}

/// Create a copy of OutingDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutingGroupCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $OutingGroupCopyWith<$Res>(_self.group!, (value) {
    return _then(_self.copyWith(group: value));
  });
}/// Create a copy of OutingDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeSlotCopyWith<$Res>? get slot {
    if (_self.slot == null) {
    return null;
  }

  return $TimeSlotCopyWith<$Res>(_self.slot!, (value) {
    return _then(_self.copyWith(slot: value));
  });
}/// Create a copy of OutingDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutingCriteriaCopyWith<$Res> get criteria {
  
  return $OutingCriteriaCopyWith<$Res>(_self.criteria, (value) {
    return _then(_self.copyWith(criteria: value));
  });
}
}

// dart format on
