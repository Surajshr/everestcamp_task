import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:everestcamp_task/core/constants/api_key.dart';
import 'package:everestcamp_task/core/constants/app_constants.dart';
import 'package:everestcamp_task/core/models/movie_model.dart';

import '../../core.dart';
import '../../exceptions/app_error.dart';
import '../api_service/network.dart';

class MovieService {
  static final Dio _dio = NetworkUtils.createDioInstance();

  Future<Either<AppError, List<Results>?>> getMovieList() async {
    try {
      final options = Options(headers: {
        'Connection': 'keep-alive',
      });
      final response = await _dio.get(
        '${AppConstants.popularMovie}?api_key=${AppKeys.apiKey}',
        options: options,
      );
      dPrint('respondFromMovieApi:${response.data}');
      final movieData = MovieModel.fromJson(
        response.data,
      );
      dPrint('movieDataAfter passing through json:${movieData.results}');
      return Right(movieData.results);
    } catch (e) {
      dPrint('Error while fetching Movie data:$e');
      return Left(
        AppError(message: 'Error while fetching Movie data'),
      );
    }
  }

  Future<Either<AppError, List<Results>?>> getSearchedMovie({
    String? searchKeyboard,
  }) async {
    try {
      dPrint('what is the keyboard:$searchKeyboard');
      final options = Options(headers: {
        'Connection': 'keep-alive',
      });
      final response = await _dio.get(
        '${AppConstants.searchUrl}?api_key=${AppKeys.apiKey}',
        queryParameters: {
          "api_key": AppKeys.apiKey,
          "query": searchKeyboard,
        },
        options: options,
      );
      dPrint('respond from executing searchApi :${response.data}');
      final movieData = MovieModel.fromJson(
        response.data,
      );
      dPrint(
          'searchMovie api after  passing through json:${movieData.results}');
      return Right(movieData.results);
    } catch (e) {
      dPrint('Error while searching Movie data:$e');
      return Left(
        AppError(message: 'Error while Searching Movie data'),
      );
    }
  }
}
