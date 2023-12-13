import 'package:dartz/dartz.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/core/use_cases/use_cases.dart';
import 'package:tmdb_ui/features/search/domain/entities/search_entity.dart';
import 'package:tmdb_ui/features/search/domain/repositories/search_repo.dart';

class GetSearchResultsUseCase extends UseCase<SearchEntity, SearchParams> {
  final SearchRepository repository;

  GetSearchResultsUseCase({required this.repository});

  @override
  Future<Either<Failure, SearchEntity>> call(SearchParams params) async {
    return await repository.getSearchResults(params.page, params.query);
  }
}

class SearchParams {
  final int page;
  final String query;
  const SearchParams(this.page, this.query);
}


