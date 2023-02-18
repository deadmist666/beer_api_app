part of 'beer_bloc.dart';

abstract class HomeScreenBeerListState extends Equatable {
  const HomeScreenBeerListState();

  @override
  List<Object> get props => [];
}

class HomeScreenBeerListInitial extends HomeScreenBeerListState {}

class HomeScreenBeerListError extends HomeScreenBeerListState {}

class HomeScreenBeerListLoaded extends HomeScreenBeerListState {
  final List<Beer> beers;

  HomeScreenBeerListLoaded({this.beers = const <Beer>[]});

  factory HomeScreenBeerListLoaded.copyWith(List<Beer> beers) {
    return HomeScreenBeerListLoaded(beers: beers);
  }

  @override
  List<Object> get props => [beers];
}
