// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:tmdb_ui/features/trending_movies/domain/entities/movie_entity.dart';

class TrendingMoviesModel extends TrendingMovies {
  const TrendingMoviesModel({
    required int page,
    required List<Result> results,
    required int totalPages,
    required int totalResults,
  }) : super(
            page: page,
            results: results,
            totalPages: totalPages,
            totalResults: totalResults);

  @override
  TrendingMoviesModel copyWith({
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return TrendingMoviesModel(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  factory TrendingMoviesModel.fromJson(Map<String, dynamic> json) =>
      TrendingMoviesModel(
        page: json["page"] ?? 1,
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class Result extends ResultEntity {
  Result({
    required bool adult,
    required int id,
    required String name,
    required String originalName,
    required double popularity,
    required int gender,
    required String profilePath,
    required List<KnownFor> knownFor,
  }) : super(
            adult: adult,
            id: id,
            name: name,
            originalName: originalName,
            popularity: popularity,
            gender: gender,
            profilePath: profilePath,
            knownFor: knownFor);

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        id: json["id"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        gender: json["gender"],
        profilePath: json["profile_path"],
        knownFor: List<KnownFor>.from(
            json["known_for"].map((x) => KnownFor.fromJson(x))),
      );

  @override
  Result copyWith({
    bool? adult,
    int? id,
    String? name,
    String? originalName,
    double? popularity,
    int? gender,
    String? profilePath,
    List<KnownFor>? knownFor,
  }) {
    return Result(
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

class KnownFor {
  bool adult;
  String? backdropPath;
  int id;
  String? title;
  String? originalTitle;
  String overview;
  String posterPath;

  List<int> genreIds;
  double popularity;
  DateTime? releaseDate;
  bool? video;
  double voteAverage;
  int voteCount;
  String? name;
  String? originalName;
  DateTime? firstAirDate;
  List<String>? originCountry;

  KnownFor({
    required this.adult,
    required this.backdropPath,
    required this.id,
    this.title,
    this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.genreIds,
    required this.popularity,
    this.releaseDate,
    this.video,
    required this.voteAverage,
    required this.voteCount,
    this.name,
    this.originalName,
    this.firstAirDate,
    this.originCountry,
  });

  factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        name: json["name"],
        originalName: json["original_name"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "popularity": popularity,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "name": name,
        "original_name": originalName,
        "first_air_date":
            "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "origin_country": originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
      };
}
