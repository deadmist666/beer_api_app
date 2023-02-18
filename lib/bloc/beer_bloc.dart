import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:beer_api_app/models/beer_details.dart';
import 'package:beer_api_app/repositories/beer_repository.dart';

part 'beer_event.dart';

part 'beer_state.dart';

class HomeScreenBeerListBloc extends Bloc<HomeScreenBeerListEvent, HomeScreenBeerListState> {
  HomeScreenBeerListBloc() : super(HomeScreenBeerListInitial()) {
    on<HomeScreenBeerListFetched>((event, emit) async {
      List<Beer> beers;
      try {
        if (state is HomeScreenBeerListInitial) {
          beers = await Repository().fetchBeerList();
          emit(HomeScreenBeerListLoaded(beers: beers));
        } else {
          HomeScreenBeerListLoaded beerLoaded = state as HomeScreenBeerListLoaded;
          beers = await Repository().fetchBeerList(beerLoaded.beers.length);
          emit(HomeScreenBeerListLoaded.copyWith(beerLoaded.beers + beers));
        }
      } catch (_) {
        emit(HomeScreenBeerListError());
      }
    });
  }
}
