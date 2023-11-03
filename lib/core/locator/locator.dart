import 'package:everestcamp_task/core/services/movie_services/movie.dart';
import 'package:get_it/get_it.dart';


GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton<MovieService>(
    () => MovieService(),
  );

  await locator.allReady();
}
