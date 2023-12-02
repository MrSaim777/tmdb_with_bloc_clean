// import 'package:dartz/dartz.dart';
// import 'package:tmdb_ui/core/error/failures.dart';
// import 'package:tmdb_ui/core/use_cases/use_cases.dart';
// import 'package:tmdb_ui/features/movie_detail/domain/entities/video_entity.dart';
// import 'package:tmdb_ui/features/movie_detail/domain/repositories/video_repo.dart';

// class GetVideo extends UseCase<VideoEntity, VideoParams> {
//   final VideoRepository repository;
//   GetVideo({required this.repository});

//   @override
//   Future<Either<Failure, VideoEntity>> call(VideoParams params) async {
//     return await repository.getVideo(params.id);
//   }
// }

// class VideoParams {
//   final int id;
//   const VideoParams(this.id);
// }
