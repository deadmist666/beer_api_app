part of 'beer_bloc.dart';

abstract class BeerState extends Equatable {
  const BeerState();

  @override
  List<Object> get props => [];
}

class BeerInitial extends BeerState {}

class BeerError extends BeerState {}

class BeerLoaded extends BeerState {
  final List<Beer> beers;

  BeerLoaded({this.beers = const <Beer>[]});

  factory BeerLoaded.copyWith(List<Beer> beers) {
    return BeerLoaded(beers: beers);
  }

  @override
  List<Object> get props => [beers];
}
