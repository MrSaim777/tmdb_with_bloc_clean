import 'package:dartz/dartz.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/features/movie_detail/domain/entities/image_entity.dart';
import 'package:tmdb_ui/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:tmdb_ui/features/movie_detail/domain/entities/video_entity.dart';


abstract class MovieDetailRepository{
   Future<Either<Failure, MovieDetailEntity>> getMovieDetail(int id); 
   Future<Either<Failure, VideoEntity>> getVideo(int id); 
   Future<Either<Failure, ImagesEntity>> getImages(int id);
}