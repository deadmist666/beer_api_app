part of 'home_beer_bloc.dart';

abstract class HomeScreenBeerListState extends Equatable {
  const HomeScreenBeerListState();

  @override
  List<Object> get props => [];
}

class HomeScreenBeerListInitial extends HomeScreenBeerListState {}

class HomeScreenBeerListError extends HomeScreenBeerListState {
  final String errorMessage;

  const HomeScreenBeerListError(this.errorMessage);
}

class HomeScreenBeerListLoaded extends HomeScreenBeerListState {
  final List<Beer> beers;
  final int loadedBeerPageIndex;

  const HomeScreenBeerListLoaded(
      {this.beers = const <Beer>[], this.loadedBeerPageIndex = 1});

  factory HomeScreenBeerListLoaded.copyWith(List<Beer> beers, int index) {
    return HomeScreenBeerListLoaded(beers: beers, loadedBeerPageIndex: index);
  }

  @override
  List<Object> get props => [beers];
}
