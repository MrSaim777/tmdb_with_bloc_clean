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

  FavoriteBloc(
      {required this.getFavoriteMoviesUseCase,
      required this.favoriteToggleUseCase})
      : super(FavoriteLoading()) {
    on<FavoriteEvent>(getFavoriteMovies);
    on<ToggleEvent>(toggleFavorite);
  }
  
  Future<void> getFavoriteMovies(
      FavoriteEvent e, Emitter<FavoriteState> emit) async {
    if (e is LoadFavMoviesEvent) {
      await getFavoriteMoviesUseCase(EmptyParams()).then((value) => emit(
          value.fold(
              (error) => FavoriteFailure(
                    message: _mapFailureToMessage(error),
                  ),
              (favoriteMovies) =>
                  FavoriteCompleted(favoriteMovies: favoriteMovies))));
    }
  }

  Future<void> toggleFavorite(
      FavoriteEvent event, Emitter<FavoriteState> emit) async {
    if (event is ToggleEvent) {
      emit(ToggleWaiting());
      await favoriteToggleUseCase(FavoriteParams(
              id: event.id,
              image: event.image,
              date: event.date,
              title: event.title,
              overview: event.overview,
              rating: event.rating))
          .then((value) => emit(value.fold((l) => ToggleError(), (isFavorite) {
                event.isFavorite = isFavorite;
                return ToggleCompleted(isFavorite: isFavorite);
              })));
    }
  }

  // bool toggleFavButton(bool value) {
  //   if (value == true) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

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

  //   Future<void> toggleFavorite(
  //   TrendingMoviesEvent e,
  //   Emitter<TrendingMoviesState> emit, {
  //   required bool isFavorite,
  //   required int id,
  //   required String image,
  //   required String date,
  //   required String title,
  //   required String overview,
  //   required double rating,
  // }) async {
  //   // try {
  //   if (e is ToggleFavoriteEvent) {
  //     emit( FavLoading());
  //     await moviesDB.toggleFavorite(
  //         isFavorite: isFavorite,
  //         id: id,
  //         image: image,
  //         date: date,
  //         title: title,
  //         overview: overview,
  //         rating: rating);
  //     emit( StopLoading());

  //   }
}
