part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteFailure extends FavoriteState {
  final String message;
  const FavoriteFailure({required this.message});
}

class FavoriteCompleted extends FavoriteState {
  final List<FavoriteMoviesEntity> favoriteMovies;

  const FavoriteCompleted({required this.favoriteMovies});
}

class ToggleWaiting extends FavoriteState {}

class ToggleError extends FavoriteState {}

class ToggleCompleted extends FavoriteState {
  final bool isFavorite;
  
  const ToggleCompleted({required this.isFavorite});
}
