import 'package:dartz/dartz.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/features/favorite/domain/entities/movie_entity.dart';

abstract class FavoriteMovieRepo {
  Future<Either<Failure, List<FavoriteMoviesEntity>>> getFavMovies();
  Future<Either<Failure, bool>> toggleFav({
    required int id,
    required String image,
    required String date,
    required String title,
    required String overview,
    required double rating,
  });
}
