import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:tmdb_ui/features/movie_detail/domain/usecases/get_movie_detail.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final GetVideo getVideo;
  final GetImages getImages;

  String? videoKey;
  // ImagesEntity? imagesEntity;
  bool isLoading = false;
  MovieDetailBloc(
      {required this.getMovieDetail,
      required this.getVideo,
      required this.getImages})
      : super(const MovieDetailLoading()) {
    on<MovieDetailEvent>(handlestate);
    on<LoadingEvent>((event, emit) => emit(const MovieDetailLoading()));
  }
  Future<void> handlestate(
      MovieDetailEvent e, Emitter<MovieDetailState> emit) async {
    if (e is LoadMovieDetailEvent) {
      final failureOrMovies = await getMovieDetail(MovieDetailParams(e.id));
      emit(failureOrMovies.fold(
          (error) => MovieDetailError(
                message: _mapFailureToMessage(error),
              ),
          (movie) => MovieDetailLoaded(movie: movie)));
    }
    if (e is LoadMovieDetailEvent) {
      // Create some bool variable to manage the state
      await getVideo(MovieDetailParams(e.id)).then(
        (value) {
          value.fold(
            (l) => null,
            (r) {
              videoKey = r.results.isNotEmpty ? r.results[0].key : "";
            },
          );
        },
      );
    }
    // if (e is LoadImagesEvent) {
    //   //triger event in state to load images
    //   //emit some bool variable
    //   await getImages(MovieDetailParams(e.id)).then((value) {
    //     value.fold((l) => null, (r) => imagesEntity = r);
    //   });
    // }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Sorry there was a server error";
      case NoInternetFailure:
        return "Sorry No Internet Connection";
      default:
        return 'Unexpected error';
    }
  }
}
