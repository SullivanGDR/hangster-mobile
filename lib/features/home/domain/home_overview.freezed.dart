// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeOverview {

 NextOuting? get nextOuting; List<TodoItem> get todos; List<FreeFriend> get freeFriends; List<OutingIdea> get ideas; int get unreadNotifications;
/// Create a copy of HomeOverview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeOverviewCopyWith<HomeOverview> get copyWith => _$HomeOverviewCopyWithImpl<HomeOverview>(this as HomeOverview, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HomeOverview;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeOverview&&(identical(other.nextOuting, _this.nextOuting) || other.nextOuting == _this.nextOuting)&&const DeepCollectionEquality().equals(other.todos, _this.todos)&&const DeepCollectionEquality().equals(other.freeFriends, _this.freeFriends)&&const DeepCollectionEquality().equals(other.ideas, _this.ideas)&&(identical(other.unreadNotifications, _this.unreadNotifications) || other.unreadNotifications == _this.unreadNotifications));
}


@override
int get hashCode {
  final _this = this as HomeOverview;
  return Object.hash(runtimeType,_this.nextOuting,const DeepCollectionEquality().hash(_this.todos),const DeepCollectionEquality().hash(_this.freeFriends),const DeepCollectionEquality().hash(_this.ideas),_this.unreadNotifications);
}

@override
String toString() {
  final _this = this as HomeOverview;
  return 'HomeOverview(nextOuting: ${_this.nextOuting}, todos: ${_this.todos}, freeFriends: ${_this.freeFriends}, ideas: ${_this.ideas}, unreadNotifications: ${_this.unreadNotifications})';
}


}

/// @nodoc
abstract mixin class $HomeOverviewCopyWith<$Res>  {
  factory $HomeOverviewCopyWith(HomeOverview value, $Res Function(HomeOverview) _then) = _$HomeOverviewCopyWithImpl;
@useResult
$Res call({
 NextOuting? nextOuting, List<TodoItem> todos, List<FreeFriend> freeFriends, List<OutingIdea> ideas, int unreadNotifications
});


$NextOutingCopyWith<$Res>? get nextOuting;

}
/// @nodoc
class _$HomeOverviewCopyWithImpl<$Res>
    implements $HomeOverviewCopyWith<$Res> {
  _$HomeOverviewCopyWithImpl(this._self, this._then);

  final HomeOverview _self;
  final $Res Function(HomeOverview) _then;

/// Create a copy of HomeOverview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nextOuting = freezed,Object? todos = null,Object? freeFriends = null,Object? ideas = null,Object? unreadNotifications = null,}) {
  return _then(HomeOverview(
nextOuting: freezed == nextOuting ? _self.nextOuting : nextOuting // ignore: cast_nullable_to_non_nullable
as NextOuting?,todos: null == todos ? _self.todos : todos // ignore: cast_nullable_to_non_nullable
as List<TodoItem>,freeFriends: null == freeFriends ? _self.freeFriends : freeFriends // ignore: cast_nullable_to_non_nullable
as List<FreeFriend>,ideas: null == ideas ? _self.ideas : ideas // ignore: cast_nullable_to_non_nullable
as List<OutingIdea>,unreadNotifications: null == unreadNotifications ? _self.unreadNotifications : unreadNotifications // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of HomeOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NextOutingCopyWith<$Res>? get nextOuting {
    if (_self.nextOuting == null) {
    return null;
  }

  return $NextOutingCopyWith<$Res>(_self.nextOuting!, (value) {
    return _then(_self.copyWith(nextOuting: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeOverview].
extension HomeOverviewPatterns on HomeOverview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeOverview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeOverview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeOverview value)  $default,){
final _that = this;
switch (_that) {
case _HomeOverview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeOverview value)?  $default,){
final _that = this;
switch (_that) {
case _HomeOverview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NextOuting? nextOuting,  List<TodoItem> todos,  List<FreeFriend> freeFriends,  List<OutingIdea> ideas,  int unreadNotifications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeOverview() when $default != null:
return $default(_that.nextOuting,_that.todos,_that.freeFriends,_that.ideas,_that.unreadNotifications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NextOuting? nextOuting,  List<TodoItem> todos,  List<FreeFriend> freeFriends,  List<OutingIdea> ideas,  int unreadNotifications)  $default,) {final _that = this;
switch (_that) {
case _HomeOverview():
return $default(_that.nextOuting,_that.todos,_that.freeFriends,_that.ideas,_that.unreadNotifications);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NextOuting? nextOuting,  List<TodoItem> todos,  List<FreeFriend> freeFriends,  List<OutingIdea> ideas,  int unreadNotifications)?  $default,) {final _that = this;
switch (_that) {
case _HomeOverview() when $default != null:
return $default(_that.nextOuting,_that.todos,_that.freeFriends,_that.ideas,_that.unreadNotifications);case _:
  return null;

}
}

}

/// @nodoc


class _HomeOverview extends HomeOverview {
  const _HomeOverview({this.nextOuting,  List<TodoItem> todos = const <TodoItem>[],  List<FreeFriend> freeFriends = const <FreeFriend>[],  List<OutingIdea> ideas = const <OutingIdea>[], this.unreadNotifications = 0}): _todos = todos,_freeFriends = freeFriends,_ideas = ideas,super._();
  

@override final  NextOuting? nextOuting;
 final  List<TodoItem> _todos;
@override@JsonKey() List<TodoItem> get todos {
  if (_todos is EqualUnmodifiableListView) return _todos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todos);
}

 final  List<FreeFriend> _freeFriends;
@override@JsonKey() List<FreeFriend> get freeFriends {
  if (_freeFriends is EqualUnmodifiableListView) return _freeFriends;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_freeFriends);
}

 final  List<OutingIdea> _ideas;
@override@JsonKey() List<OutingIdea> get ideas {
  if (_ideas is EqualUnmodifiableListView) return _ideas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ideas);
}

@override@JsonKey() final  int unreadNotifications;

/// Create a copy of HomeOverview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeOverviewCopyWith<_HomeOverview> get copyWith => __$HomeOverviewCopyWithImpl<_HomeOverview>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeOverview&&(identical(other.nextOuting, nextOuting) || other.nextOuting == nextOuting)&&const DeepCollectionEquality().equals(other.todos, _todos)&&const DeepCollectionEquality().equals(other.freeFriends, _freeFriends)&&const DeepCollectionEquality().equals(other.ideas, _ideas)&&(identical(other.unreadNotifications, unreadNotifications) || other.unreadNotifications == unreadNotifications));
}


@override
int get hashCode {
    return Object.hash(runtimeType,nextOuting,const DeepCollectionEquality().hash(_todos),const DeepCollectionEquality().hash(_freeFriends),const DeepCollectionEquality().hash(_ideas),unreadNotifications);
}

@override
String toString() {
    return 'HomeOverview(nextOuting: $nextOuting, todos: $todos, freeFriends: $freeFriends, ideas: $ideas, unreadNotifications: $unreadNotifications)';
}


}

/// @nodoc
abstract mixin class _$HomeOverviewCopyWith<$Res> implements $HomeOverviewCopyWith<$Res> {
  factory _$HomeOverviewCopyWith(_HomeOverview value, $Res Function(_HomeOverview) _then) = __$HomeOverviewCopyWithImpl;
@override @useResult
$Res call({
 NextOuting? nextOuting, List<TodoItem> todos, List<FreeFriend> freeFriends, List<OutingIdea> ideas, int unreadNotifications
});


@override $NextOutingCopyWith<$Res>? get nextOuting;

}
/// @nodoc
class __$HomeOverviewCopyWithImpl<$Res>
    implements _$HomeOverviewCopyWith<$Res> {
  __$HomeOverviewCopyWithImpl(this._self, this._then);

  final _HomeOverview _self;
  final $Res Function(_HomeOverview) _then;

/// Create a copy of HomeOverview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nextOuting = freezed,Object? todos = null,Object? freeFriends = null,Object? ideas = null,Object? unreadNotifications = null,}) {
  return _then(_HomeOverview(
nextOuting: freezed == nextOuting ? _self.nextOuting : nextOuting // ignore: cast_nullable_to_non_nullable
as NextOuting?,todos: null == todos ? _self._todos : todos // ignore: cast_nullable_to_non_nullable
as List<TodoItem>,freeFriends: null == freeFriends ? _self._freeFriends : freeFriends // ignore: cast_nullable_to_non_nullable
as List<FreeFriend>,ideas: null == ideas ? _self._ideas : ideas // ignore: cast_nullable_to_non_nullable
as List<OutingIdea>,unreadNotifications: null == unreadNotifications ? _self.unreadNotifications : unreadNotifications // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of HomeOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NextOutingCopyWith<$Res>? get nextOuting {
    if (_self.nextOuting == null) {
    return null;
  }

  return $NextOutingCopyWith<$Res>(_self.nextOuting!, (value) {
    return _then(_self.copyWith(nextOuting: value));
  });
}
}

// dart format on
