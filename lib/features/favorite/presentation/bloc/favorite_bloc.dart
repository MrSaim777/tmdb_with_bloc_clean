import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/features/favorite/domain/entities/movie_entity.dart';
import 'package:tmdb_ui/features/favorite/domain/usecases/favorite_usecase.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  GetFavoriteMoviesUseCase getFavoriteMoviesUseCase;
  FavoriteToggleUseCase favoriteToggleUseCase;
  List<FavoriteMoviesEntity> favoriteMoviesList = [];

  FavoriteBloc(
      {required this.getFavoriteMoviesUseCase,
      required this.favoriteToggleUseCase})
      : super(FavoriteLoading()) {
    on<FavoriteEvent>(getFavoriteMovies);
    on<ToggleEvent>(toggleFavorite);
    on<AddFavLoadingEvent>((event, emit) => emit(FavoriteLoading()));
  }

  Future<void> getFavoriteMovies(
      FavoriteEvent e, Emitter<FavoriteState> emit) async {
    if (e is LoadFavMoviesEvent) {
      await getFavoriteMoviesUseCase(EmptyParams())
          .then((value) => emit(value.fold(
                  (error) => FavoriteFailure(
                        message: _mapFailureToMessage(error),
                      ), (favoriteMovies) {
                favoriteMoviesList = favoriteMovies;
                return FavoriteCompleted(favoriteMovies: favoriteMovies);
              })));
    }
  }

  Future<void> toggleFavorite(
      FavoriteEvent event, Emitter<FavoriteState> emit) async {
    if (event is ToggleEvent) {
      emit(ToggleWaiting());
      favoriteToggleUseCase(FavoriteParams(
              id: event.id,
              image: event.image,
              date: event.date,
              title: event.title,
              overview: event.overview,
              rating: event.rating))
          .then((value) {
        emit.isDone;
        emit(value.fold((l) => ToggleError(), (isFavorite) {
          return ToggleCompleted(isFavorite: isFavorite);
        }));
      });
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Sorry there was a server error";
      case CatchError:
        return "Something went wrong";
      case NoInternetFailure:
        return "Sorry No Internet Connection";
      default:
        return 'Unexpected error';
    }
  }
}
