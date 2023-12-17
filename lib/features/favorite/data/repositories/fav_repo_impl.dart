import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/core/network/network_info.dart';
import 'package:tmdb_ui/features/favorite/data/datasources/database/movies_database.dart';
import 'package:tmdb_ui/features/favorite/domain/entities/movie_entity.dart';
import 'package:tmdb_ui/features/favorite/domain/repositories/favorite_repo.dart';

class FavoriteMovieRepoImplementation extends FavoriteMovieRepo {
  final MoviesDB moviesDB;
  final NetworkInfo networkInfo;

  FavoriteMovieRepoImplementation(
      {required this.moviesDB, required this.networkInfo}) {
    log("Favorite DataSource Initialized", name: "Now Initialized");
  }
  @override
  Future<Either<Failure, List<FavoriteMoviesEntity>>> getFavMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final results = await moviesDB.fetchAll();
        // log(results.toString(), name: "favorites");
        return Right(results);
      } catch (e, t) {
        log('Error: ${e.toString()} Path: ${t.toString()}'.toString(),
            name: "Favorite Exception");
        return Left(CatchError());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> toggleFav(
      {required int id,
      required String image,
      required String date,
      required String title,
      required String overview,
      required double rating}) async {
    try {
      final results = await moviesDB.toggleFavorite(
          id: id,
          image: image,
          date: date,
          title: title,
          overview: overview,
          rating: rating);
      return Right(results);
    } catch (e, t) {
      log('Error: ${e.toString()} Path: ${t.toString()}'.toString(),
          name: "Favorite Exception");
      return Left(CatchError());
    }
  }
}
