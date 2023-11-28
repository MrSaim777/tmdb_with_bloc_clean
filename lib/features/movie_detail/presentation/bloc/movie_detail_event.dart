part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieDetailEvent extends MovieDetailEvent {
  final int id;
  const LoadMovieDetailEvent({required this.id});
}

class LoadingEvent extends MovieDetailEvent {}
// class ReLoadMovieDetailEvent extends MovieDetailEvent {
//   final int id;
//   const ReLoadMovieDetailEvent({required this.id});
// }
