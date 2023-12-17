// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class FavoriteMoviesEntity extends Equatable {
  final int id;
  final String image;
  final String date;
  final String savedAt;
  final String title;
  final String overview;
  final double rating;
  const FavoriteMoviesEntity({
    required this.id,
    required this.image,
    required this.date,
    required this.savedAt,
    required this.title,
    required this.overview,
    required this.rating,
  });

  @override
  List<Object?> get props =>
      [id, image, date, savedAt, title, overview, rating];

  FavoriteMoviesEntity copyWith({
    int? id,
    String? image,
    String? date,
    String? savedAt,
    String? title,
    String? overview,
    double? rating,
  }) {
    return FavoriteMoviesEntity(
      id: id ?? this.id,
      image: image ?? this.image,
      date: date ?? this.date,
      savedAt: savedAt ?? this.savedAt,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      rating: rating ?? this.rating,
    );
  }
}
