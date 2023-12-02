import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:tmdb_ui/core/error/exceptions.dart';
import 'package:tmdb_ui/core/utils/constants/endpoints.dart';
import 'package:tmdb_ui/features/movie_detail/data/models/images_model.dart';
import 'package:tmdb_ui/features/movie_detail/data/models/movie_detail_model.dart';
import 'package:tmdb_ui/features/movie_detail/data/models/video_model.dart';

abstract class MovieDetailDataSource {
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<VideoModel> getVideo(int id);
  Future<ImagesModel> getImages(int id);
}

// abstract class VideoDataSource {
//   Future<VideoModel> getVideo(int id);
// }

// abstract class ImagesDataSource {
//   Future<ImagesModel> getImages(int id);
// }

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

  @override
  Future<VideoModel> getVideo(int id) async {
    final Map<String, dynamic> params = <String, dynamic>{};
    params[ApiParam.apiKey] = BaseUrl.API_KEY;

    final Response response = await dio.get(
        BaseUrl.baseUrl +
            ApiEndPoints.Movie_Detail +
            id.toString() +
            ApiEndPoints.Movie_Videos,
        queryParameters: params);

    if (response.statusCode == 200) {
      VideoModel model = VideoModel.fromJson(response.data);
      return model;
    } else {
      log("Error", name: "Error");
      throw ServerException();
    }
  }

  @override
  Future<ImagesModel> getImages(int id) async {
    final Map<String, dynamic> params = <String, dynamic>{};
    params[ApiParam.apiKey] = BaseUrl.API_KEY;

    final Response response = await dio.get(
        BaseUrl.baseUrl +
            ApiEndPoints.Movie_Detail +
            id.toString() +
            ApiEndPoints.Movie_Images,
        queryParameters: params);

    if (response.statusCode == 200) {
      ImagesModel model = ImagesModel.fromJson(response.data);
      return model;
    } else {
      log("Error", name: "Error");
      throw ServerException();
    }
  }
}

// class VideoDataSourceImpl extends VideoDataSource {
//   final Dio dio;

//   VideoDataSourceImpl({
//     required this.dio,
//   }) {
//     log("Video Data Source Initialized");
//   }

  // @override
  // Future<VideoModel> getVideo(int id) async {
  //   final Map<String, dynamic> params = <String, dynamic>{};
  //   params[ApiParam.apiKey] = BaseUrl.API_KEY;

  //   final Response response = await dio.get(
  //       BaseUrl.baseUrl +
  //           ApiEndPoints.Movie_Detail +
  //           id.toString() +
  //           ApiEndPoints.Movie_Videos,
  //       queryParameters: params);

  //   if (response.statusCode == 200) {
  //     VideoModel model = VideoModel.fromJson(response.data);
  //     return model;
  //   } else {
  //     log("Error", name: "Error");
  //     throw ServerException();
  //   }
  // }
// }

// class ImagesDataSourceImpl extends ImagesDataSource {
//   final Dio dio;

//   ImagesDataSourceImpl({
//     required this.dio,
//   }) {
//     log("Images Data Source Initialized");
//   }

  // @override
  // Future<ImagesModel> getImages(int id) async {
  //   final Map<String, dynamic> params = <String, dynamic>{};
  //   params[ApiParam.apiKey] = BaseUrl.API_KEY;

  //   final Response response = await dio.get(
  //       BaseUrl.baseUrl +
  //           ApiEndPoints.Movie_Detail +
  //           id.toString() +
  //           ApiEndPoints.Movie_Images,
  //       queryParameters: params);

  //   if (response.statusCode == 200) {
  //     ImagesModel model = ImagesModel.fromJson(response.data);
  //     return model;
  //   } else {
  //     log("Error", name: "Error");
  //     throw ServerException();
  //   }
  // }
// }
