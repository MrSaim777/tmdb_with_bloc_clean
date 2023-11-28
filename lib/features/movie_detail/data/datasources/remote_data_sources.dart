import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:tmdb_ui/core/error/exceptions.dart';
import 'package:tmdb_ui/core/utils/constants/endpoints.dart';
import 'package:tmdb_ui/features/movie_detail/data/models/movie_detail_model.dart';

abstract class MovieDetailDataSource {
  Future<MovieDetailModel> getMovieDetail(int id);
}

class MovieDetailDataSourceImpl extends MovieDetailDataSource {
  final Dio dio;

  MovieDetailDataSourceImpl({
    required this.dio,
  }) {
    log("MovieDetailData Source Initialized");
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final Map<String, dynamic> params = <String, dynamic>{};
    params[ApiParam.apiKey] = BaseUrl.API_KEY;

    final Response response = await dio.get(
        BaseUrl.baseUrl + ApiEndPoints.Movie_Detail + id.toString(),
        queryParameters: params);

    if (response.statusCode == 200) {
      MovieDetailModel model = MovieDetailModel.fromJson(response.data);
      return model;
    } else {
      log("Error", name: "Error");
      throw ServerException();
    }
  }
}
