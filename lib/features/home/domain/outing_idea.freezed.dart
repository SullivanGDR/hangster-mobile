// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outing_idea.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OutingIdea {

 String get id; String get title; String get category; int get priceEuros; int get travelMinutes;
/// Create a copy of OutingIdea
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutingIdeaCopyWith<OutingIdea> get copyWith => _$OutingIdeaCopyWithImpl<OutingIdea>(this as OutingIdea, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OutingIdea;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutingIdea&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.priceEuros, _this.priceEuros) || other.priceEuros == _this.priceEuros)&&(identical(other.travelMinutes, _this.travelMinutes) || other.travelMinutes == _this.travelMinutes));
}


@override
int get hashCode {
  final _this = this as OutingIdea;
  return Object.hash(runtimeType,_this.id,_this.title,_this.category,_this.priceEuros,_this.travelMinutes);
}

@override
String toString() {
  final _this = this as OutingIdea;
  return 'OutingIdea(id: ${_this.id}, title: ${_this.title}, category: ${_this.category}, priceEuros: ${_this.priceEuros}, travelMinutes: ${_this.travelMinutes})';
}


}

/// @nodoc
abstract mixin class $OutingIdeaCopyWith<$Res>  {
  factory $OutingIdeaCopyWith(OutingIdea value, $Res Function(OutingIdea) _then) = _$OutingIdeaCopyWithImpl;
@useResult
$Res call({
 String id, String title, String category, int priceEuros, int travelMinutes
});




}
/// @nodoc
class _$OutingIdeaCopyWithImpl<$Res>
    implements $OutingIdeaCopyWith<$Res> {
  _$OutingIdeaCopyWithImpl(this._self, this._then);

  final OutingIdea _self;
  final $Res Function(OutingIdea) _then;

/// Create a copy of OutingIdea
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? category = null,Object? priceEuros = null,Object? travelMinutes = null,}) {
  return _then(OutingIdea(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,priceEuros: null == priceEuros ? _self.priceEuros : priceEuros // ignore: cast_nullable_to_non_nullable
as int,travelMinutes: null == travelMinutes ? _self.travelMinutes : travelMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OutingIdea].
extension OutingIdeaPatterns on OutingIdea {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutingIdea value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutingIdea() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutingIdea value)  $default,){
final _that = this;
switch (_that) {
case _OutingIdea():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutingIdea value)?  $default,){
final _that = this;
switch (_that) {
case _OutingIdea() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String category,  int priceEuros,  int travelMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutingIdea() when $default != null:
return $default(_that.id,_that.title,_that.category,_that.priceEuros,_that.travelMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String category,  int priceEuros,  int travelMinutes)  $default,) {final _that = this;
switch (_that) {
case _OutingIdea():
return $default(_that.id,_that.title,_that.category,_that.priceEuros,_that.travelMinutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String category,  int priceEuros,  int travelMinutes)?  $default,) {final _that = this;
switch (_that) {
case _OutingIdea() when $default != null:
return $default(_that.id,_that.title,_that.category,_that.priceEuros,_that.travelMinutes);case _:
  return null;

}
}

}

/// @nodoc


class _OutingIdea implements OutingIdea {
  const _OutingIdea({required this.id, required this.title, required this.category, required this.priceEuros, required this.travelMinutes});
  

@override final  String id;
@override final  String title;
@override final  String category;
@override final  int priceEuros;
@override final  int travelMinutes;

/// Create a copy of OutingIdea
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutingIdeaCopyWith<_OutingIdea> get copyWith => __$OutingIdeaCopyWithImpl<_OutingIdea>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutingIdea&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.priceEuros, priceEuros) || other.priceEuros == priceEuros)&&(identical(other.travelMinutes, travelMinutes) || other.travelMinutes == travelMinutes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,category,priceEuros,travelMinutes);
}

@override
String toString() {
    return 'OutingIdea(id: $id, title: $title, category: $category, priceEuros: $priceEuros, travelMinutes: $travelMinutes)';
}


}

/// @nodoc
abstract mixin class _$OutingIdeaCopyWith<$Res> implements $OutingIdeaCopyWith<$Res> {
  factory _$OutingIdeaCopyWith(_OutingIdea value, $Res Function(_OutingIdea) _then) = __$OutingIdeaCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String category, int priceEuros, int travelMinutes
});




}
/// @nodoc
class __$OutingIdeaCopyWithImpl<$Res>
    implements _$OutingIdeaCopyWith<$Res> {
  __$OutingIdeaCopyWithImpl(this._self, this._then);

  final _OutingIdea _self;
  final $Res Function(_OutingIdea) _then;

/// Create a copy of OutingIdea
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? category = null,Object? priceEuros = null,Object? travelMinutes = null,}) {
  return _then(_OutingIdea(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,priceEuros: null == priceEuros ? _self.priceEuros : priceEuros // ignore: cast_nullable_to_non_nullable
as int,travelMinutes: null == travelMinutes ? _self.travelMinutes : travelMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
