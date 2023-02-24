part of 'home_beer_bloc.dart';

abstract class HomeScreenBeerListEvent extends Equatable {
  const HomeScreenBeerListEvent();

  @override
  List<Object> get props => [];
}


class HomeScreenBeerListFetched extends HomeScreenBeerListEvent {}