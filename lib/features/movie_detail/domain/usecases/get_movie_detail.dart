import 'package:dartz/dartz.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/core/use_cases/use_cases.dart';
import 'package:tmdb_ui/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:tmdb_ui/features/movie_detail/domain/repositories/movie_detail_repo.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity, MovieDetailParams> {
  final MovieDetailRepository repository;
  GetMovieDetail({required this.repository});

  @override
  Future<Either<Failure, MovieDetailEntity>> call(MovieDetailParams params) async {
    return await repository.getMovieDetail(params.id);
  }
}

class MovieDetailParams {
  final int id;
  const MovieDetailParams(this.id);
}
