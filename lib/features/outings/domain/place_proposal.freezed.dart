// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_proposal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlaceProposal {

 String get id; String get name; OutingCategory get category; int get priceEuros; int get durationMinutes; int get minTravelMinutes; int get maxTravelMinutes;
/// Create a copy of PlaceProposal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceProposalCopyWith<PlaceProposal> get copyWith => _$PlaceProposalCopyWithImpl<PlaceProposal>(this as PlaceProposal, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlaceProposal;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceProposal&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.priceEuros, _this.priceEuros) || other.priceEuros == _this.priceEuros)&&(identical(other.durationMinutes, _this.durationMinutes) || other.durationMinutes == _this.durationMinutes)&&(identical(other.minTravelMinutes, _this.minTravelMinutes) || other.minTravelMinutes == _this.minTravelMinutes)&&(identical(other.maxTravelMinutes, _this.maxTravelMinutes) || other.maxTravelMinutes == _this.maxTravelMinutes));
}


@override
int get hashCode {
  final _this = this as PlaceProposal;
  return Object.hash(runtimeType,_this.id,_this.name,_this.category,_this.priceEuros,_this.durationMinutes,_this.minTravelMinutes,_this.maxTravelMinutes);
}

@override
String toString() {
  final _this = this as PlaceProposal;
  return 'PlaceProposal(id: ${_this.id}, name: ${_this.name}, category: ${_this.category}, priceEuros: ${_this.priceEuros}, durationMinutes: ${_this.durationMinutes}, minTravelMinutes: ${_this.minTravelMinutes}, maxTravelMinutes: ${_this.maxTravelMinutes})';
}


}

/// @nodoc
abstract mixin class $PlaceProposalCopyWith<$Res>  {
  factory $PlaceProposalCopyWith(PlaceProposal value, $Res Function(PlaceProposal) _then) = _$PlaceProposalCopyWithImpl;
@useResult
$Res call({
 String id, String name, OutingCategory category, int priceEuros, int durationMinutes, int minTravelMinutes, int maxTravelMinutes
});




}
/// @nodoc
class _$PlaceProposalCopyWithImpl<$Res>
    implements $PlaceProposalCopyWith<$Res> {
  _$PlaceProposalCopyWithImpl(this._self, this._then);

  final PlaceProposal _self;
  final $Res Function(PlaceProposal) _then;

/// Create a copy of PlaceProposal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? priceEuros = null,Object? durationMinutes = null,Object? minTravelMinutes = null,Object? maxTravelMinutes = null,}) {
  return _then(PlaceProposal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as OutingCategory,priceEuros: null == priceEuros ? _self.priceEuros : priceEuros // ignore: cast_nullable_to_non_nullable
as int,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,minTravelMinutes: null == minTravelMinutes ? _self.minTravelMinutes : minTravelMinutes // ignore: cast_nullable_to_non_nullable
as int,maxTravelMinutes: null == maxTravelMinutes ? _self.maxTravelMinutes : maxTravelMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaceProposal].
extension PlaceProposalPatterns on PlaceProposal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceProposal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceProposal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceProposal value)  $default,){
final _that = this;
switch (_that) {
case _PlaceProposal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceProposal value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceProposal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  OutingCategory category,  int priceEuros,  int durationMinutes,  int minTravelMinutes,  int maxTravelMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceProposal() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.priceEuros,_that.durationMinutes,_that.minTravelMinutes,_that.maxTravelMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  OutingCategory category,  int priceEuros,  int durationMinutes,  int minTravelMinutes,  int maxTravelMinutes)  $default,) {final _that = this;
switch (_that) {
case _PlaceProposal():
return $default(_that.id,_that.name,_that.category,_that.priceEuros,_that.durationMinutes,_that.minTravelMinutes,_that.maxTravelMinutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  OutingCategory category,  int priceEuros,  int durationMinutes,  int minTravelMinutes,  int maxTravelMinutes)?  $default,) {final _that = this;
switch (_that) {
case _PlaceProposal() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.priceEuros,_that.durationMinutes,_that.minTravelMinutes,_that.maxTravelMinutes);case _:
  return null;

}
}

}

/// @nodoc


class _PlaceProposal extends PlaceProposal {
  const _PlaceProposal({required this.id, required this.name, required this.category, required this.priceEuros, required this.durationMinutes, required this.minTravelMinutes, required this.maxTravelMinutes}): super._();
  

@override final  String id;
@override final  String name;
@override final  OutingCategory category;
@override final  int priceEuros;
@override final  int durationMinutes;
@override final  int minTravelMinutes;
@override final  int maxTravelMinutes;

/// Create a copy of PlaceProposal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceProposalCopyWith<_PlaceProposal> get copyWith => __$PlaceProposalCopyWithImpl<_PlaceProposal>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceProposal&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.priceEuros, priceEuros) || other.priceEuros == priceEuros)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.minTravelMinutes, minTravelMinutes) || other.minTravelMinutes == minTravelMinutes)&&(identical(other.maxTravelMinutes, maxTravelMinutes) || other.maxTravelMinutes == maxTravelMinutes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,category,priceEuros,durationMinutes,minTravelMinutes,maxTravelMinutes);
}

@override
String toString() {
    return 'PlaceProposal(id: $id, name: $name, category: $category, priceEuros: $priceEuros, durationMinutes: $durationMinutes, minTravelMinutes: $minTravelMinutes, maxTravelMinutes: $maxTravelMinutes)';
}


}

/// @nodoc
abstract mixin class _$PlaceProposalCopyWith<$Res> implements $PlaceProposalCopyWith<$Res> {
  factory _$PlaceProposalCopyWith(_PlaceProposal value, $Res Function(_PlaceProposal) _then) = __$PlaceProposalCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, OutingCategory category, int priceEuros, int durationMinutes, int minTravelMinutes, int maxTravelMinutes
});




}
/// @nodoc
class __$PlaceProposalCopyWithImpl<$Res>
    implements _$PlaceProposalCopyWith<$Res> {
  __$PlaceProposalCopyWithImpl(this._self, this._then);

  final _PlaceProposal _self;
  final $Res Function(_PlaceProposal) _then;

/// Create a copy of PlaceProposal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? priceEuros = null,Object? durationMinutes = null,Object? minTravelMinutes = null,Object? maxTravelMinutes = null,}) {
  return _then(_PlaceProposal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as OutingCategory,priceEuros: null == priceEuros ? _self.priceEuros : priceEuros // ignore: cast_nullable_to_non_nullable
as int,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,minTravelMinutes: null == minTravelMinutes ? _self.minTravelMinutes : minTravelMinutes // ignore: cast_nullable_to_non_nullable
as int,maxTravelMinutes: null == maxTravelMinutes ? _self.maxTravelMinutes : maxTravelMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
