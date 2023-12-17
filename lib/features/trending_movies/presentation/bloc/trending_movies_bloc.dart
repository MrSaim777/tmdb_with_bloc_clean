import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/features/trending_movies/domain/entities/movie_entity.dart';
import 'package:tmdb_ui/features/trending_movies/domain/usecases/get_movies.dart';

part 'trending_movies_event.dart';
part 'trending_movies_state.dart';

class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetMovies getMovies;

  TrendingMoviesBloc({
    required this.getMovies,
  }) : super(const TrendingMoviesLoading()) {
    on<TrendingMoviesEvent>((handlestate));
  }

  Future<void> handlestate(
      TrendingMoviesEvent e, Emitter<TrendingMoviesState> emit) async {
    if (e is LoadTredingMovies) {
      final failureOrMovies = await getMovies(MovieParams(e.page));

      emit(failureOrMovies.fold(
          (error) => TrendingMoviesError(
                message: _mapFailureToMessage(error),
              ),
          (movies) => TrendingMoviesCompleted(movies: movies)));
    }
  }

  onNavigateToDetailsPage() {}
  
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
