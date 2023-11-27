import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tmdb_ui/core/error/exceptions.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/core/network/network_info.dart';
import 'package:tmdb_ui/features/trending_movies/data/datasources/remote_data_sources.dart';
import 'package:tmdb_ui/features/trending_movies/domain/entities/movie_entity.dart';
import 'package:tmdb_ui/features/trending_movies/domain/repositories/movies_repo.dart';


class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDataSource moviesDataSource;
  final NetworkInfo networkInfo;

  MoviesRepositoryImpl(
      {required this.moviesDataSource, required this.networkInfo}) {
    log("MovieData Source Initielized", name: "Now Initialized");
  }

  @override
  Future<Either<Failure, List<ResultEntity>>> getMovies(int page) async {
    if (await networkInfo.isConnected) {
      try {
        final movies = await moviesDataSource.getMovies(page);
        return Right(movies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
