// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ImagesEntity extends Equatable {
  final List<Backdrop> backdrops;
  final int id;
  final List<Backdrop> logos;
  final List<Backdrop> posters;

  const ImagesEntity({
    required this.backdrops,
    required this.id,
    required this.logos,
    required this.posters,
  });

  ImagesEntity copyWith({
    List<Backdrop>? backdrops,
    int? id,
    List<Backdrop>? logos,
    List<Backdrop>? posters,
  }) {
    return ImagesEntity(
      backdrops: backdrops ?? this.backdrops,
      id: id ?? this.id,
      logos: logos ?? this.logos,
      posters: posters ?? this.posters,
    );
  }

  @override
  List<Object?> get props => [backdrops, id, logos, posters];
}

class Backdrop {
  String filePath;

  Backdrop({
    required this.filePath,
  });

  factory Backdrop.fromJson(Map<String, dynamic> json) => Backdrop(
        filePath: json["file_path"],
      );

  Map<String, dynamic> toJson() => {
        "file_path": filePath,
      };
}
