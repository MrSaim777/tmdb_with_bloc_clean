import 'dart:convert';

import 'package:tmdb_ui/features/movie_detail/domain/entities/image_entity.dart';

ImagesModel imagesModelFromJson(String str) =>
    ImagesModel.fromJson(json.decode(str));

String imagesModelToJson(ImagesModel data) => json.encode(data.toJson());

class ImagesModel extends ImagesEntity {
  const ImagesModel({
    required List<Backdrop> backdrops,
    required int id,
    required List<Backdrop> logos,
    required List<Backdrop> posters,
  }) : super(backdrops: backdrops, id: id, logos: logos, posters: posters);

  factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
        backdrops: List<Backdrop>.from(
            json["backdrops"].map((x) => Backdrop.fromJson(x))),
        id: json["id"],
        logos:
            List<Backdrop>.from(json["logos"].map((x) => Backdrop.fromJson(x))),
        posters: List<Backdrop>.from(
            json["posters"].map((x) => Backdrop.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "backdrops": List<dynamic>.from(backdrops.map((x) => x.toJson())),
        "id": id,
        "logos": List<dynamic>.from(logos.map((x) => x.toJson())),
        "posters": List<dynamic>.from(posters.map((x) => x.toJson())),
      };
}
