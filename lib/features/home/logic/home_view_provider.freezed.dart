// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_view_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeViewState {
  String get error => throw _privateConstructorUsedError;
  AsyncValue<List<Results>> get movieList => throw _privateConstructorUsedError;
  AsyncValue<List<Results>> get searchedMovie =>
      throw _privateConstructorUsedError;
  bool get isTextFieldEmpty => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeViewStateCopyWith<HomeViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeViewStateCopyWith<$Res> {
  factory $HomeViewStateCopyWith(
          HomeViewState value, $Res Function(HomeViewState) then) =
      _$HomeViewStateCopyWithImpl<$Res, HomeViewState>;
  @useResult
  $Res call(
      {String error,
      AsyncValue<List<Results>> movieList,
      AsyncValue<List<Results>> searchedMovie,
      bool isTextFieldEmpty});
}

/// @nodoc
class _$HomeViewStateCopyWithImpl<$Res, $Val extends HomeViewState>
    implements $HomeViewStateCopyWith<$Res> {
  _$HomeViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? movieList = null,
    Object? searchedMovie = null,
    Object? isTextFieldEmpty = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      movieList: null == movieList
          ? _value.movieList
          : movieList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Results>>,
      searchedMovie: null == searchedMovie
          ? _value.searchedMovie
          : searchedMovie // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Results>>,
      isTextFieldEmpty: null == isTextFieldEmpty
          ? _value.isTextFieldEmpty
          : isTextFieldEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeViewStateImplCopyWith<$Res>
    implements $HomeViewStateCopyWith<$Res> {
  factory _$$HomeViewStateImplCopyWith(
          _$HomeViewStateImpl value, $Res Function(_$HomeViewStateImpl) then) =
      __$$HomeViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String error,
      AsyncValue<List<Results>> movieList,
      AsyncValue<List<Results>> searchedMovie,
      bool isTextFieldEmpty});
}

/// @nodoc
class __$$HomeViewStateImplCopyWithImpl<$Res>
    extends _$HomeViewStateCopyWithImpl<$Res, _$HomeViewStateImpl>
    implements _$$HomeViewStateImplCopyWith<$Res> {
  __$$HomeViewStateImplCopyWithImpl(
      _$HomeViewStateImpl _value, $Res Function(_$HomeViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? movieList = null,
    Object? searchedMovie = null,
    Object? isTextFieldEmpty = null,
  }) {
    return _then(_$HomeViewStateImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      movieList: null == movieList
          ? _value.movieList
          : movieList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Results>>,
      searchedMovie: null == searchedMovie
          ? _value.searchedMovie
          : searchedMovie // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Results>>,
      isTextFieldEmpty: null == isTextFieldEmpty
          ? _value.isTextFieldEmpty
          : isTextFieldEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HomeViewStateImpl implements _HomeViewState {
  const _$HomeViewStateImpl(
      {this.error = '',
      this.movieList = const AsyncLoading(),
      this.searchedMovie = const AsyncLoading(),
      this.isTextFieldEmpty = true});

  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final AsyncValue<List<Results>> movieList;
  @override
  @JsonKey()
  final AsyncValue<List<Results>> searchedMovie;
  @override
  @JsonKey()
  final bool isTextFieldEmpty;

  @override
  String toString() {
    return 'HomeViewState(error: $error, movieList: $movieList, searchedMovie: $searchedMovie, isTextFieldEmpty: $isTextFieldEmpty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeViewStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.movieList, movieList) ||
                other.movieList == movieList) &&
            (identical(other.searchedMovie, searchedMovie) ||
                other.searchedMovie == searchedMovie) &&
            (identical(other.isTextFieldEmpty, isTextFieldEmpty) ||
                other.isTextFieldEmpty == isTextFieldEmpty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, error, movieList, searchedMovie, isTextFieldEmpty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeViewStateImplCopyWith<_$HomeViewStateImpl> get copyWith =>
      __$$HomeViewStateImplCopyWithImpl<_$HomeViewStateImpl>(this, _$identity);
}

abstract class _HomeViewState implements HomeViewState {
  const factory _HomeViewState(
      {final String error,
      final AsyncValue<List<Results>> movieList,
      final AsyncValue<List<Results>> searchedMovie,
      final bool isTextFieldEmpty}) = _$HomeViewStateImpl;

  @override
  String get error;
  @override
  AsyncValue<List<Results>> get movieList;
  @override
  AsyncValue<List<Results>> get searchedMovie;
  @override
  bool get isTextFieldEmpty;
  @override
  @JsonKey(ignore: true)
  _$$HomeViewStateImplCopyWith<_$HomeViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
