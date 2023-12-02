import 'package:dartz/dartz.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/core/use_cases/use_cases.dart';
import 'package:tmdb_ui/features/movie_detail/domain/entities/image_entity.dart';
import 'package:tmdb_ui/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:tmdb_ui/features/movie_detail/domain/entities/video_entity.dart';
import 'package:tmdb_ui/features/movie_detail/domain/repositories/movie_detail_repo.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity, MovieDetailParams> {
  final MovieDetailRepository repository;
  GetMovieDetail({required this.repository});

  @override
  Future<Either<Failure, MovieDetailEntity>> call(
      MovieDetailParams params) async {
    return await repository.getMovieDetail(params.id);
  }
}

class GetVideo extends UseCase<VideoEntity, MovieDetailParams> {
  final MovieDetailRepository repository;
  GetVideo({required this.repository});

  @override
  Future<Either<Failure, VideoEntity>> call(MovieDetailParams params) async {
    return await repository.getVideo(params.id);
  }
}

class GetImages extends UseCase<ImagesEntity, MovieDetailParams> {
  final MovieDetailRepository repository;
  GetImages({required this.repository});

  @override
  Future<Either<Failure, ImagesEntity>> call(MovieDetailParams params) async {
    return await repository.getImages(params.id);
  }
}

class MovieDetailParams {
  final int id;
  const MovieDetailParams(this.id);
}
