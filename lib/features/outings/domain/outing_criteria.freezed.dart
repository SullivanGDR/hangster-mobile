// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outing_criteria.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OutingCriteria {

 BudgetRange get budget; int get maxTravelMinutes;
/// Create a copy of OutingCriteria
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutingCriteriaCopyWith<OutingCriteria> get copyWith => _$OutingCriteriaCopyWithImpl<OutingCriteria>(this as OutingCriteria, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OutingCriteria;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutingCriteria&&(identical(other.budget, _this.budget) || other.budget == _this.budget)&&(identical(other.maxTravelMinutes, _this.maxTravelMinutes) || other.maxTravelMinutes == _this.maxTravelMinutes));
}


@override
int get hashCode {
  final _this = this as OutingCriteria;
  return Object.hash(runtimeType,_this.budget,_this.maxTravelMinutes);
}

@override
String toString() {
  final _this = this as OutingCriteria;
  return 'OutingCriteria(budget: ${_this.budget}, maxTravelMinutes: ${_this.maxTravelMinutes})';
}


}

/// @nodoc
abstract mixin class $OutingCriteriaCopyWith<$Res>  {
  factory $OutingCriteriaCopyWith(OutingCriteria value, $Res Function(OutingCriteria) _then) = _$OutingCriteriaCopyWithImpl;
@useResult
$Res call({
 BudgetRange budget, int maxTravelMinutes
});




}
/// @nodoc
class _$OutingCriteriaCopyWithImpl<$Res>
    implements $OutingCriteriaCopyWith<$Res> {
  _$OutingCriteriaCopyWithImpl(this._self, this._then);

  final OutingCriteria _self;
  final $Res Function(OutingCriteria) _then;

/// Create a copy of OutingCriteria
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? budget = null,Object? maxTravelMinutes = null,}) {
  return _then(OutingCriteria(
budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as BudgetRange,maxTravelMinutes: null == maxTravelMinutes ? _self.maxTravelMinutes : maxTravelMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OutingCriteria].
extension OutingCriteriaPatterns on OutingCriteria {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutingCriteria value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutingCriteria() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutingCriteria value)  $default,){
final _that = this;
switch (_that) {
case _OutingCriteria():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutingCriteria value)?  $default,){
final _that = this;
switch (_that) {
case _OutingCriteria() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BudgetRange budget,  int maxTravelMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutingCriteria() when $default != null:
return $default(_that.budget,_that.maxTravelMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BudgetRange budget,  int maxTravelMinutes)  $default,) {final _that = this;
switch (_that) {
case _OutingCriteria():
return $default(_that.budget,_that.maxTravelMinutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BudgetRange budget,  int maxTravelMinutes)?  $default,) {final _that = this;
switch (_that) {
case _OutingCriteria() when $default != null:
return $default(_that.budget,_that.maxTravelMinutes);case _:
  return null;

}
}

}

/// @nodoc


class _OutingCriteria implements OutingCriteria {
  const _OutingCriteria({this.budget = BudgetRange.from15to30, this.maxTravelMinutes = 30});
  

@override@JsonKey() final  BudgetRange budget;
@override@JsonKey() final  int maxTravelMinutes;

/// Create a copy of OutingCriteria
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutingCriteriaCopyWith<_OutingCriteria> get copyWith => __$OutingCriteriaCopyWithImpl<_OutingCriteria>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutingCriteria&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.maxTravelMinutes, maxTravelMinutes) || other.maxTravelMinutes == maxTravelMinutes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,budget,maxTravelMinutes);
}

@override
String toString() {
    return 'OutingCriteria(budget: $budget, maxTravelMinutes: $maxTravelMinutes)';
}


}

/// @nodoc
abstract mixin class _$OutingCriteriaCopyWith<$Res> implements $OutingCriteriaCopyWith<$Res> {
  factory _$OutingCriteriaCopyWith(_OutingCriteria value, $Res Function(_OutingCriteria) _then) = __$OutingCriteriaCopyWithImpl;
@override @useResult
$Res call({
 BudgetRange budget, int maxTravelMinutes
});




}
/// @nodoc
class __$OutingCriteriaCopyWithImpl<$Res>
    implements _$OutingCriteriaCopyWith<$Res> {
  __$OutingCriteriaCopyWithImpl(this._self, this._then);

  final _OutingCriteria _self;
  final $Res Function(_OutingCriteria) _then;

/// Create a copy of OutingCriteria
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? budget = null,Object? maxTravelMinutes = null,}) {
  return _then(_OutingCriteria(
budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as BudgetRange,maxTravelMinutes: null == maxTravelMinutes ? _self.maxTravelMinutes : maxTravelMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
