part of 'trending_movies_bloc.dart';

abstract class TrendingMoviesState extends Equatable {
  const TrendingMoviesState();

  @override
  List<Object> get props => [];
}

class TrendingMoviesError extends TrendingMoviesState {
  final String message;

  const TrendingMoviesError({
    required this.message,
  });
}

class TrendingMoviesLoading extends TrendingMoviesState {
  const TrendingMoviesLoading();
}

class TrendingMoviesCompleted extends TrendingMoviesState {
  final List<ResultEntity> movies;
  const TrendingMoviesCompleted({
    required this.movies,
  });
}

