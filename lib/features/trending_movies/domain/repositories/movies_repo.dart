import 'package:dartz/dartz.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/features/trending_movies/domain/entities/movie_entity.dart';


abstract class MoviesRepository{
   Future<Either<Failure, List<ResultEntity>>> getMovies(int page); 
}