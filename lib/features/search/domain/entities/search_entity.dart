// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class SearchEntity extends Equatable {
  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;

  const SearchEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];

  SearchEntity copyWith({
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return SearchEntity(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}

class Result {
  int id;
  String overview;
  String posterPath;
  // DateTime releaseDate;
  String title;
  double voteAverage;

  Result({
    required this.id,
    required this.overview,
    required this.posterPath,
    // required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        overview: json["overview"] ?? "",
        posterPath: json["poster_path"] ?? "",
        // releaseDate: DateTime.parse(json["release_date"] ??
            // json[DateFormat('yyyy-MM-dd').format(DateTime.now())]
            // ),
        title: json["title"] ?? "",
        voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "overview": overview,
        "poster_path": posterPath,
        // "release_date":
        //     "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "vote_average": voteAverage,
      };
}
