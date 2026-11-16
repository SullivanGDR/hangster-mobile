// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'taste_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AreaZone {

 String get label; double get latitude; double get longitude;
/// Create a copy of AreaZone
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AreaZoneCopyWith<AreaZone> get copyWith => _$AreaZoneCopyWithImpl<AreaZone>(this as AreaZone, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AreaZone;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AreaZone&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude));
}


@override
int get hashCode {
  final _this = this as AreaZone;
  return Object.hash(runtimeType,_this.label,_this.latitude,_this.longitude);
}

@override
String toString() {
  final _this = this as AreaZone;
  return 'AreaZone(label: ${_this.label}, latitude: ${_this.latitude}, longitude: ${_this.longitude})';
}


}

/// @nodoc
abstract mixin class $AreaZoneCopyWith<$Res>  {
  factory $AreaZoneCopyWith(AreaZone value, $Res Function(AreaZone) _then) = _$AreaZoneCopyWithImpl;
@useResult
$Res call({
 String label, double latitude, double longitude
});




}
/// @nodoc
class _$AreaZoneCopyWithImpl<$Res>
    implements $AreaZoneCopyWith<$Res> {
  _$AreaZoneCopyWithImpl(this._self, this._then);

  final AreaZone _self;
  final $Res Function(AreaZone) _then;

/// Create a copy of AreaZone
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? latitude = null,Object? longitude = null,}) {
  return _then(AreaZone(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AreaZone].
extension AreaZonePatterns on AreaZone {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AreaZone value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AreaZone() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AreaZone value)  $default,){
final _that = this;
switch (_that) {
case _AreaZone():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AreaZone value)?  $default,){
final _that = this;
switch (_that) {
case _AreaZone() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  double latitude,  double longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AreaZone() when $default != null:
return $default(_that.label,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  double latitude,  double longitude)  $default,) {final _that = this;
switch (_that) {
case _AreaZone():
return $default(_that.label,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  double latitude,  double longitude)?  $default,) {final _that = this;
switch (_that) {
case _AreaZone() when $default != null:
return $default(_that.label,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc


class _AreaZone implements AreaZone {
  const _AreaZone({required this.label, required this.latitude, required this.longitude});
  

@override final  String label;
@override final  double latitude;
@override final  double longitude;

/// Create a copy of AreaZone
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AreaZoneCopyWith<_AreaZone> get copyWith => __$AreaZoneCopyWithImpl<_AreaZone>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AreaZone&&(identical(other.label, label) || other.label == label)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode {
    return Object.hash(runtimeType,label,latitude,longitude);
}

@override
String toString() {
    return 'AreaZone(label: $label, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$AreaZoneCopyWith<$Res> implements $AreaZoneCopyWith<$Res> {
  factory _$AreaZoneCopyWith(_AreaZone value, $Res Function(_AreaZone) _then) = __$AreaZoneCopyWithImpl;
@override @useResult
$Res call({
 String label, double latitude, double longitude
});




}
/// @nodoc
class __$AreaZoneCopyWithImpl<$Res>
    implements _$AreaZoneCopyWith<$Res> {
  __$AreaZoneCopyWithImpl(this._self, this._then);

  final _AreaZone _self;
  final $Res Function(_AreaZone) _then;

/// Create a copy of AreaZone
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? latitude = null,Object? longitude = null,}) {
  return _then(_AreaZone(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$TastePreferences {

 Set<OutingCategory> get categories; BudgetRange? get budget; AreaZone? get zone;
/// Create a copy of TastePreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TastePreferencesCopyWith<TastePreferences> get copyWith => _$TastePreferencesCopyWithImpl<TastePreferences>(this as TastePreferences, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TastePreferences;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TastePreferences&&const DeepCollectionEquality().equals(other.categories, _this.categories)&&(identical(other.budget, _this.budget) || other.budget == _this.budget)&&(identical(other.zone, _this.zone) || other.zone == _this.zone));
}


@override
int get hashCode {
  final _this = this as TastePreferences;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.categories),_this.budget,_this.zone);
}

@override
String toString() {
  final _this = this as TastePreferences;
  return 'TastePreferences(categories: ${_this.categories}, budget: ${_this.budget}, zone: ${_this.zone})';
}


}

/// @nodoc
abstract mixin class $TastePreferencesCopyWith<$Res>  {
  factory $TastePreferencesCopyWith(TastePreferences value, $Res Function(TastePreferences) _then) = _$TastePreferencesCopyWithImpl;
@useResult
$Res call({
 Set<OutingCategory> categories, BudgetRange? budget, AreaZone? zone
});


$AreaZoneCopyWith<$Res>? get zone;

}
/// @nodoc
class _$TastePreferencesCopyWithImpl<$Res>
    implements $TastePreferencesCopyWith<$Res> {
  _$TastePreferencesCopyWithImpl(this._self, this._then);

  final TastePreferences _self;
  final $Res Function(TastePreferences) _then;

/// Create a copy of TastePreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? budget = freezed,Object? zone = freezed,}) {
  return _then(TastePreferences(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as Set<OutingCategory>,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as BudgetRange?,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as AreaZone?,
  ));
}
/// Create a copy of TastePreferences
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AreaZoneCopyWith<$Res>? get zone {
    if (_self.zone == null) {
    return null;
  }

  return $AreaZoneCopyWith<$Res>(_self.zone!, (value) {
    return _then(_self.copyWith(zone: value));
  });
}
}


/// Adds pattern-matching-related methods to [TastePreferences].
extension TastePreferencesPatterns on TastePreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TastePreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TastePreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TastePreferences value)  $default,){
final _that = this;
switch (_that) {
case _TastePreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TastePreferences value)?  $default,){
final _that = this;
switch (_that) {
case _TastePreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<OutingCategory> categories,  BudgetRange? budget,  AreaZone? zone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TastePreferences() when $default != null:
return $default(_that.categories,_that.budget,_that.zone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<OutingCategory> categories,  BudgetRange? budget,  AreaZone? zone)  $default,) {final _that = this;
switch (_that) {
case _TastePreferences():
return $default(_that.categories,_that.budget,_that.zone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<OutingCategory> categories,  BudgetRange? budget,  AreaZone? zone)?  $default,) {final _that = this;
switch (_that) {
case _TastePreferences() when $default != null:
return $default(_that.categories,_that.budget,_that.zone);case _:
  return null;

}
}

}

/// @nodoc


class _TastePreferences implements TastePreferences {
  const _TastePreferences({ Set<OutingCategory> categories = const <OutingCategory>{}, this.budget, this.zone}): _categories = categories;
  

 final  Set<OutingCategory> _categories;
@override@JsonKey() Set<OutingCategory> get categories {
  if (_categories is EqualUnmodifiableSetView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_categories);
}

@override final  BudgetRange? budget;
@override final  AreaZone? zone;

/// Create a copy of TastePreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TastePreferencesCopyWith<_TastePreferences> get copyWith => __$TastePreferencesCopyWithImpl<_TastePreferences>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TastePreferences&&const DeepCollectionEquality().equals(other.categories, _categories)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.zone, zone) || other.zone == zone));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),budget,zone);
}

@override
String toString() {
    return 'TastePreferences(categories: $categories, budget: $budget, zone: $zone)';
}


}

/// @nodoc
abstract mixin class _$TastePreferencesCopyWith<$Res> implements $TastePreferencesCopyWith<$Res> {
  factory _$TastePreferencesCopyWith(_TastePreferences value, $Res Function(_TastePreferences) _then) = __$TastePreferencesCopyWithImpl;
@override @useResult
$Res call({
 Set<OutingCategory> categories, BudgetRange? budget, AreaZone? zone
});


@override $AreaZoneCopyWith<$Res>? get zone;

}
/// @nodoc
class __$TastePreferencesCopyWithImpl<$Res>
    implements _$TastePreferencesCopyWith<$Res> {
  __$TastePreferencesCopyWithImpl(this._self, this._then);

  final _TastePreferences _self;
  final $Res Function(_TastePreferences) _then;

/// Create a copy of TastePreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? budget = freezed,Object? zone = freezed,}) {
  return _then(_TastePreferences(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as Set<OutingCategory>,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as BudgetRange?,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as AreaZone?,
  ));
}

/// Create a copy of TastePreferences
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AreaZoneCopyWith<$Res>? get zone {
    if (_self.zone == null) {
    return null;
  }

  return $AreaZoneCopyWith<$Res>(_self.zone!, (value) {
    return _then(_self.copyWith(zone: value));
  });
}
}

// dart format on
