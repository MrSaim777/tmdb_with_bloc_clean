import 'dart:convert';

import 'package:tmdb_ui/features/search/domain/entities/search_entity.dart';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel extends SearchEntity {
  const SearchModel({
    required int page,
    required List<Result> results,
    required int totalPages,
    required int totalResults,
  }) : super(
            page: page,
            results: results,
            totalPages: totalPages,
            totalResults: totalResults);

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
