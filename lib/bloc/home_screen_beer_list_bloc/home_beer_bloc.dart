import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:beer_api_app/models/beer_details.dart';
import 'package:beer_api_app/repositories/beer_repository.dart';

part 'home_beer_event.dart';

part 'home_beer_state.dart';

class HomeScreenBeerListBloc
    extends Bloc<HomeScreenBeerListEvent, HomeScreenBeerListState> {
  HomeScreenBeerListBloc() : super(HomeScreenBeerListInitial()) {
    on<HomeScreenBeerListFetched>((event, emit) async {
      List<Beer> beers;
      if (state is HomeScreenBeerListInitial) {
        beers = await Repository()
            .fetchBeerList()
            .timeout(Duration(milliseconds: 5000), onTimeout: () {
          beers = [];
          emit(HomeScreenBeerListError(
              'The beer list was not loaded.\n\nCheck your internet connection and try again.'));
          return beers;
        });
        if (beers.isNotEmpty) {
          emit(HomeScreenBeerListLoaded(beers: beers));
        }
      } else {
        HomeScreenBeerListLoaded beerLoaded = state as HomeScreenBeerListLoaded;
        beers = await Repository().fetchBeerList(beerLoaded.beers.length);
        emit(HomeScreenBeerListLoaded.copyWith(beerLoaded.beers + beers));
      }
    });
  }
}
