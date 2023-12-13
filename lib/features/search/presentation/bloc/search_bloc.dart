import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_ui/core/error/failures.dart';
import 'package:tmdb_ui/features/search/domain/entities/search_entity.dart';
import 'package:tmdb_ui/features/search/domain/usecases/search_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchResultsUseCase getSearchResultsUseCase;

  final searchController = TextEditingController();
  SearchBloc(this.getSearchResultsUseCase) : super(SearchLoading()) {
    on<SearchEvent>(handleState);
  }

  Future<void> handleState(SearchEvent e, Emitter<SearchState> emit) async {
    if (e is AddSearchQueryEvent) {
      String query = searchController.text.toString();
      emit(SearchLoading());
      await getSearchResultsUseCase(SearchParams(1, query))
          .then((value) => emit(value.fold(
              (error) => SearchFailure(
                    message: _mapFailureToMessage(error),
                  ),
              (results) => SearchCompleted(searchEntity: results))));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Sorry there was a server error";
      case NoInternetFailure:
        return "Sorry No Internet Connection";
      default:
        return 'Unexpected error';
    }
  }
}
