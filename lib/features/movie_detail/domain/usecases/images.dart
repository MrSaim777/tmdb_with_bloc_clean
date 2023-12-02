// import 'package:dartz/dartz.dart';
// import 'package:tmdb_ui/core/error/failures.dart';
// import 'package:tmdb_ui/core/use_cases/use_cases.dart';
// import 'package:tmdb_ui/features/movie_detail/domain/entities/image_entity.dart';
// import 'package:tmdb_ui/features/movie_detail/domain/repositories/images_repo.dart';

// class GetImages extends UseCase<ImagesEntity, ImagesParams> {
//   final ImagesRepository repository;
//   GetImages({required this.repository});

//   @override
//   Future<Either<Failure, ImagesEntity>> call(ImagesParams params) async {
//     return await repository.getImages(params.id);
//   }
// }

// class ImagesParams {
//   final int id;
//   const ImagesParams(this.id);
// }
