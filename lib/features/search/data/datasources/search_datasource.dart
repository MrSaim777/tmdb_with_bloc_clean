import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:tmdb_ui/core/error/exceptions.dart';
import 'package:tmdb_ui/core/utils/constants/endpoints.dart';
import 'package:tmdb_ui/features/search/data/models/search_model.dart';

abstract class SearchDataSource {
  Future<SearchModel> getSearchResults(int page, String query);
}

class SearchDataSourceImpl extends SearchDataSource {
  final Dio dio;

  SearchDataSourceImpl({
    required this.dio,
  }) {
    log("Search Data Source Initialized");
  }

  @override
  Future<SearchModel> getSearchResults(int page, String query) async {
    final Map<String, dynamic> params = <String, dynamic>{};
    params[ApiParam.apiKey] = BaseUrl.API_KEY;
    params[ApiParam.page] = page;
    params[ApiParam.query] = query;

    final Response response = await dio.get(
        BaseUrl.baseUrl + ApiEndPoints.Search_Movie,
        queryParameters: params);
    if (response.statusCode == 200) {
      SearchModel searchModel = SearchModel.fromJson(response.data);
    return searchModel;
    } else {
      log("Error", name: "Error on Searching");
      throw ServerException();
    }
  }
}
