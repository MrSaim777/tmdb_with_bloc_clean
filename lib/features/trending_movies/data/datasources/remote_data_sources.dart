import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:tmdb_ui/core/error/exceptions.dart';
import 'package:tmdb_ui/core/utils/constants/endpoints.dart';
import 'package:tmdb_ui/features/trending_movies/data/models/movies_model.dart';


abstract class MoviesDataSource {
  Future<List<Result>> getMovies(int page);
}

class MoviesDataSourceImpl extends MoviesDataSource {
  final Dio dio;

  MoviesDataSourceImpl({
    required this.dio,
  }) {
    log("MovieData Source Initialized");
  }

  @override
  Future<List<Result>> getMovies(int page) async {
    final Map<String, dynamic> params = <String, dynamic>{};
    params[ApiParam.page] = page;
    params[ApiParam.apiKey] = BaseUrl.API_KEY;
    final Response response = await dio.get(
        BaseUrl.baseUrl + ApiEndPoints.Trending_Movies,
        queryParameters: params);
    if (response.statusCode == 200) {
      List<Result> list = [];
      list = TrendingMoviesModel.fromJson(response.data).results;
      // list = response.data['results'];
      //       // Convert dynamic list to List<Result>
      // list = (response.data['results'] as List<dynamic>)
      //     .map((dynamic item) => Result.fromJson(item))
      //     .toList();
      return list;
    } else {
      log("Error", name: "Error");
      throw ServerException();
    }
  }
}
