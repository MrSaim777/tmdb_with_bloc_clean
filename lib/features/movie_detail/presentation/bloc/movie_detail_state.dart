part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];

  add() {}
}
// abstract class VideoState extends Equatable {
//   const VideoState();

//   @override
//   List<Object> get props => [];
// }
// abstract class ImagesState extends Equatable {
//   const ImagesState();

//   @override
//   List<Object> get props => [];
// }
class MovieDetailError extends MovieDetailState {
  final String message;

  const MovieDetailError({
    required this.message,
  });
}

// class VideoError extends VideoState {
//   final String message;

//   const VideoError({
//     required this.message,
//   });
// }

// class ImagesError extends ImagesState {
//   final String message;

//   const ImagesError({
//     required this.message,
//   });
// }

class MovieDetailLoading extends MovieDetailState {
  const MovieDetailLoading();
}

// class VideoLoadingState extends VideoState{
//   const VideoLoadingState();
// }


// class ImagesLoadingState extends VideoState{
//   const ImagesLoadingState();
// }
class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailEntity movie;
  const MovieDetailLoaded({
    required this.movie,
  });
}

// class VideoLoaded extends VideoState {
//   final VideoEntity video;
//   const VideoLoaded({
//     required this.video,
//   });
// }

// class ImagesLoaded extends ImagesState {
//   final ImagesEntity images;
//   const ImagesLoaded({
//     required this.images,
//   });
// }
