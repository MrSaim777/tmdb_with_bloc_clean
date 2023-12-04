import 'package:dartz/dartz.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/features/search/domain/entities/search_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchEntity>> getSearchResults(
      int page, String query);
}
