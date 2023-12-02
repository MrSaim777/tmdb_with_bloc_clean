import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final int id;
  final List<Result> results;

  const VideoEntity({
    required this.id,
    required this.results,
  });

  @override
  List<Object> get props => [id, results];

  VideoEntity copyWith({
    int? id,
    List<Result>? results,
  }) {
    return VideoEntity(
      id: id ?? this.id,
      results: results ?? this.results,
    );
  }
}

class Result {
  String name;
  String key;
  String id;

  Result({
    required this.name,
    required this.key,
    required this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        key: json["key"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "key": key,
        "id": id,
      };
}
