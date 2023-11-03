part of 'home_view_provider.dart';

class HomeViewModel extends StateNotifier<HomeViewState> {
  HomeViewModel(
    this.goRouter,
  ) : super(const HomeViewState());
  final GoRouter goRouter;
  final TextEditingController _searchTextController =
      TextEditingController(text: '');

  TextEditingController get searchTextController => _searchTextController;
  final _deBouncer = DeBouncer(milliseconds: 500);
  final firebaseService = locator<MovieService>();

  void onChangedSearch(String keyword) {
    if (searchTextController.text.isEmpty) {
      state = state.copyWith(
        isTextFieldEmpty: false,
      );
    } else {
      _deBouncer.run(() async {
        if (searchTextController.text.isEmpty) {
          return;
        }
        if (keyword.isNotEmpty) {
          state = state.copyWith(isTextFieldEmpty: false);
        } else {
          state = state.copyWith(isTextFieldEmpty: true);
        }
      });
    }
  }

  Future<void> onClearSearch() async {
    try {
      _searchTextController.clear();
      state = state.copyWith(
        isTextFieldEmpty: true,
      );
    } catch (e) {
      dPrint('failed to clear');
    } finally {
      getMovieList();
    }
  }

  Future<void> getMovieList() async {
    try {
      final respond = await firebaseService.getMovieList();
      respond.fold((l) {
        state = state.copyWith(
          movieList: const AsyncData([]),
        );
        dPrint('caughed error on getMovieList method:$l');
      }, (movie) {
        if (movie != null && movie.isNotEmpty) {
          state = state.copyWith(
            movieList: AsyncData(movie),
          );
        }
      });
    } catch (e) {
      state = state.copyWith(
        movieList: const AsyncData([]),
      );
      dPrint('failed to fetch tha movie data from the api::$e');
    }
  }

  void goToMovieDetailPage({
    required BuildContext context,
    required String imageUrl,
    required String movieDescription,
    required String movieTitle,
    required num movieRating,
    required String releaseDate,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailBaseView(
          imageURl: imageUrl,
          movieDescription: movieDescription,
          movieTitle: movieTitle,
          movieRating: movieRating,
          releaseDate: releaseDate,
        ),
      ),
    );
  }

  Future<void> searchMovie(
    String searchKeyboard,
  ) async {
    try {
      final respond = await firebaseService.getSearchedMovie(
        searchKeyboard: searchKeyboard,
      );
      respond.fold((l) {
        state = state.copyWith(
          movieList: const AsyncData([]),
        );
        dPrint('error on searching movie method :$l');
      }, (movie) {
        dPrint('searched movie List :${movie?.length}');
        // if (movie != null && movie.isNotEmpty) {
        state = state.copyWith(
          movieList: AsyncData(movie!),
        );
        // }
      });
    } catch (e) {
      state = state.copyWith(
        searchedMovie: const AsyncData([]),
      );
      dPrint('failed to fetch tha searched movie data from the api::$e');
    }
  }
}
