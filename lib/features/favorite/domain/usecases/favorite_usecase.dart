import 'package:dartz/dartz.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/core/use_cases/use_cases.dart';
import 'package:tmdb_ui/features/favorite/domain/entities/movie_entity.dart';
import 'package:tmdb_ui/features/favorite/domain/repositories/favorite_repo.dart';

class GetFavoriteMoviesUseCase
    extends UseCase<List<FavoriteMoviesEntity>, EmptyParams> {
  final FavoriteMovieRepo favoriteMovieRepo;

  GetFavoriteMoviesUseCase({required this.favoriteMovieRepo});
  @override
  Future<Either<Failure, List<FavoriteMoviesEntity>>> call(params) async {
    return await favoriteMovieRepo.getFavMovies();
  }
}

class FavoriteToggleUseCase extends UseCase<bool, FavoriteParams> {
  final FavoriteMovieRepo favoriteMovieRepo;

  FavoriteToggleUseCase({required this.favoriteMovieRepo});
  @override
  Future<Either<Failure, bool>> call(FavoriteParams params) async {
    return await favoriteMovieRepo.toggleFav(
        id: params.id,
        image: params.image,
        date: params.date,
        title: params.title,
        overview: params.overview,
        rating: params.rating);
  }
}

class EmptyParams {}

class FavoriteParams {
  final int id;
  final String image;
  final String date;
  final String title;
  final String overview;
  final double rating;
  FavoriteParams({
    required this.id,
    required this.image,
    required this.date,
    required this.title,
    required this.overview,
    required this.rating,
  });
}
