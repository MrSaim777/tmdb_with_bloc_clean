part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {}

class SearchFailure extends SearchState {
  final String message;

  const SearchFailure({required this.message});
}

class SearchCompleted extends SearchState {
  final SearchEntity searchEntity;
  const SearchCompleted({required this.searchEntity});
}
