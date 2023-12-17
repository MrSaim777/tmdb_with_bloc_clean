part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavMoviesEvent extends FavoriteEvent {}

class ToggleEvent extends FavoriteEvent {
  
  final int id;
  final String image;
  final String date;
  final String title;
  final String overview;
  final double rating;

  const ToggleEvent(
      {required this.id,
      required this.image,
      required this.date,
      required this.title,
      required this.overview,
      required this.rating});
}
