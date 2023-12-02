// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:tmdb_ui/features/movie_detail/data/models/movie_detail_model.dart';

class MovieDetailEntity extends Equatable {
  final String backdropPath;
  final List<Genre> genres;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final DateTime releaseDate;
  final int revenue;
  final List<SpokenLanguage> spokenLanguages;
  final String tagline;
  final String title;
  final double voteAverage;

  const MovieDetailEntity({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.spokenLanguages,
    required this.tagline,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => throw UnimplementedError();

  MovieDetailEntity copyWith({
    String? backdropPath,
    List<Genre>? genres,
    int? id,
    String? imdbId,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCompany>? productionCompanies,
    List<ProductionCountry>? productionCountries,
    DateTime? releaseDate,
    int? revenue,
    List<SpokenLanguage>? spokenLanguages,
    String? tagline,
    String? title,
    double? voteAverage,
  }) {
    return MovieDetailEntity(
      backdropPath: backdropPath ?? this.backdropPath,
      genres: genres ?? this.genres,
      id: id ?? this.id,
      imdbId: imdbId ?? this.imdbId,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      productionCountries: productionCountries ?? this.productionCountries,
      releaseDate: releaseDate ?? this.releaseDate,
      revenue: revenue ?? this.revenue,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      tagline: tagline ?? this.tagline,
      title: title ?? this.title,
      voteAverage: voteAverage ?? this.voteAverage,
    );
  }
}
