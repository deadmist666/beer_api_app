part of 'search_beer_bloc.dart';

abstract class SearchBeerState extends Equatable {
  const SearchBeerState();

  @override
  List<Object> get props => [];
}

class SearchBeerInitial extends SearchBeerState {}

class SearchBeerHistoryInitial extends SearchBeerState {
 final List<Beer> beers;

  SearchBeerHistoryInitial(this.beers);
}

class SearchBeerLoading extends SearchBeerState {}

class SearchBeerLoaded extends SearchBeerState {
  final List<Beer>? beers;

  const SearchBeerLoaded({required this.beers});
}

class SearchBeerError extends SearchBeerState {
  final String errorMessage;

  SearchBeerError(this.errorMessage);
}
