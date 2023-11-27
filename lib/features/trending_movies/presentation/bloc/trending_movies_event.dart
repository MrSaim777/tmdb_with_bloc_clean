part of 'trending_movies_bloc.dart';

abstract class TrendingMoviesEvent extends Equatable {
  const TrendingMoviesEvent();

  @override
  List<Object> get props => [];
}

class LoadTredingMovies extends TrendingMoviesEvent {
  final int page;
  const LoadTredingMovies({required this.page});
}
