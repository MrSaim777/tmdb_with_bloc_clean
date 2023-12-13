import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tmdb_ui/core/error/exceptions.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/core/network/network_info.dart';
import 'package:tmdb_ui/features/search/data/datasources/search_datasource.dart';
import 'package:tmdb_ui/features/search/domain/entities/search_entity.dart';
import 'package:tmdb_ui/features/search/domain/repositories/search_repo.dart';

class SeachRepositoryImplementation extends SearchRepository {
  final SearchDataSource searchDataSource;
  final NetworkInfo networkInfo;

  SeachRepositoryImplementation(
      {required this.searchDataSource, required this.networkInfo}) {
    log("Search Data Source Initialized", name: "Now Initialized");
  }

  @override
  Future<Either<Failure, SearchEntity>> getSearchResults(
      int page, String query) async {
    if (await networkInfo.isConnected) {
      try {
        final results = await searchDataSource.getSearchResults(page, query);
        // log(results.results.toString(), name: "results");
        return Right(results);
      } on ServerException {
        return Left(ServerFailure());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
