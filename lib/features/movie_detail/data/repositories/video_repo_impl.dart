// import 'dart:developer';

// import 'package:dartz/dartz.dart';
// import 'package:tmdb_ui/core/error/exceptions.dart';
// import 'package:tmdb_ui/core/error/failures.dart';
// import 'package:tmdb_ui/core/network/network_info.dart';
// import 'package:tmdb_ui/features/movie_detail/data/datasources/remote_data_sources.dart';
// import 'package:tmdb_ui/features/movie_detail/domain/entities/movie_detail_entity.dart';
// import 'package:tmdb_ui/features/movie_detail/domain/entities/video_entity.dart';
// import 'package:tmdb_ui/features/movie_detail/domain/repositories/movie_detail_repo.dart';
// import 'package:tmdb_ui/features/movie_detail/domain/repositories/video_repo.dart';



// class VideoRepositoryImpl implements VideoRepository {
//   final VideoDataSource videoDataSource;
//   final NetworkInfo networkInfo;

//   VideoRepositoryImpl(
//       {required this.movieDetailDataSource, required this.networkInfo}) {
//     log("Video Data Source Initialized", name: "Now Initialized");
//   }

  // @override
  // Future<Either<Failure, VideoEntity>> getVideo(int id) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final movie = await movieDetailDataSource.getMovieDetail(id);
  //       return Right(movie);
  //     } on ServerException {
  //       return Left(ServerFailure());
  //     }
  //   } else {
  //     return Left(NoInternetFailure());
  //   }
  // }
// }