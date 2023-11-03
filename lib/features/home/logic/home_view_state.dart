part of 'home_view_provider.dart';

@freezed
class HomeViewState with _$HomeViewState {
  const factory HomeViewState({
    @Default('') String error,
    @Default(AsyncLoading()) AsyncValue<List<Results>> movieList,
    @Default(AsyncLoading()) AsyncValue<List<Results>> searchedMovie,
    @Default(true)
    bool isTextFieldEmpty,
  }) = _HomeViewState;
}
