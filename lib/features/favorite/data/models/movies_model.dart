import 'package:tmdb_ui/features/favorite/domain/entities/movie_entity.dart';

class FavoriteMoviesModel extends FavoriteMoviesEntity {
  const FavoriteMoviesModel({
    required int id,
    required String image,
    required String date,
    required String savedAt,
    required String title,
    required String overview,
    required double rating,
  }) : super(
            id: id,
            image: image,
            date: date,
            savedAt: savedAt,
            title: title,
            overview: overview,
            rating: rating);

  factory FavoriteMoviesModel.fromSqfliteDatabase(Map<String, dynamic> map) {
    return FavoriteMoviesModel(
      id: map['id'] as int,
      image: map['image'] as String,
      date: map['date'] as String,
      savedAt: DateTime.fromMillisecondsSinceEpoch(map['saved_at'])
          .toIso8601String(),
      title: map['title'] as String,
      overview: map['overview'] as String,
      rating: map['rating'] as double,
    );
  }
}
