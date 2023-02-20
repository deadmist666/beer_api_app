part of 'search_beer_bloc.dart';

abstract class SearchBeerEvent extends Equatable {
  const SearchBeerEvent();

  @override
  List<Object> get props => [];
}

class SearchBeerChangedQuery extends SearchBeerEvent {
  final String query;

  SearchBeerChangedQuery(this.query);
}

class SearchBeerClearedQuery extends SearchBeerEvent {}
