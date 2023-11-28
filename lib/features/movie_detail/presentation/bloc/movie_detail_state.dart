part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}


class MovieDetailError extends MovieDetailState {
  final String message;

  const MovieDetailError({
    required this.message,
  });
}

class MovieDetailLoading extends MovieDetailState {
  const MovieDetailLoading();
}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailEntity movie;
  const MovieDetailLoaded({
    required this.movie,
  });
}
