// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:tmdb_ui/features/trending_movies/data/models/movies_model.dart';


class TrendingMovies extends Equatable {
  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;

  const TrendingMovies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  TrendingMovies copyWith({
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      TrendingMovies(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}

class ResultEntity {
  final bool adult;
  final int id;
  final String name;
  final String originalName;
  final double popularity;
  final int gender;
  final String profilePath;
  final List<KnownFor> knownFor;

  ResultEntity({
    required this.adult,
    required this.id,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.gender,
    required this.profilePath,
    required this.knownFor,
  });

  ResultEntity copyWith({
    bool? adult,
    int? id,
    String? name,
    String? originalName,
    double? popularity,
    int? gender,
    String? profilePath,
    List<KnownFor>? knownFor,
  }) {
    return ResultEntity(
      adult: adult ?? this.adult,
      id: id ?? this.id,
      name: name ?? this.name,
      originalName: originalName ?? this.originalName,
      popularity: popularity ?? this.popularity,
      gender: gender ?? this.gender,
      profilePath: profilePath ?? this.profilePath,
      knownFor: knownFor ?? this.knownFor,
    );
  }
}
