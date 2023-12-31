import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tmdb_ui/core/error/exceptions.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/core/network/network_info.dart';
import 'package:tmdb_ui/features/movie_detail/data/datasources/remote_data_sources.dart';
import 'package:tmdb_ui/features/movie_detail/domain/entities/image_entity.dart';
import 'package:tmdb_ui/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:tmdb_ui/features/movie_detail/domain/entities/video_entity.dart';
import 'package:tmdb_ui/features/movie_detail/domain/repositories/movie_detail_repo.dart';

class MovieDetailRepositoryImpl implements MovieDetailRepository {
  final MovieDetailDataSource movieDetailDataSource;
  final NetworkInfo networkInfo;

  MovieDetailRepositoryImpl(
      {required this.movieDetailDataSource, required this.networkInfo}) {
    log("MovieDetailData Source Initialized", name: "Now Initialized");
  }

  @override
  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final movie = await movieDetailDataSource.getMovieDetail(id);
        return Right(movie);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, ImagesEntity>> getImages(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final movie = await movieDetailDataSource.getImages(id);
        log(movie.logos[0].filePath, name: "images");
        return Right(movie);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, VideoEntity>> getVideo(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final movie = await movieDetailDataSource.getVideo(id);
        log(movie.results[0].key, name: "Video key");
        return Right(movie);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
