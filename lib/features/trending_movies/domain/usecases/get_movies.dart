import 'package:dartz/dartz.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/core/use_cases/use_cases.dart';
import 'package:tmdb_ui/features/trending_movies/domain/entities/movie_entity.dart';
import 'package:tmdb_ui/features/trending_movies/domain/repositories/movies_repo.dart';


class GetMovies extends UseCase<List<ResultEntity>, MovieParams> {
  final MoviesRepository repository;
  GetMovies({required this.repository});

  @override
  Future<Either<Failure, List<ResultEntity>>> call(MovieParams params) async {
    return await repository.getMovies(params.page);
  }
}

class MovieParams {
  final int page;
  const MovieParams(this.page);
}
