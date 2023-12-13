part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class AddSearchQueryEvent extends SearchEvent {
  final String query;

  const AddSearchQueryEvent({required this.query});
}
