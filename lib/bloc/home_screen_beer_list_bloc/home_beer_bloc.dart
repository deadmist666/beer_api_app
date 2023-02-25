import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:beer_api_app/models/beer_details.dart';
import 'package:beer_api_app/repositories/beer_repository.dart';

part 'home_beer_event.dart';

part 'home_beer_state.dart';

class HomeScreenBeerListBloc
    extends Bloc<HomeScreenBeerListEvent, HomeScreenBeerListState> {
  final List<List<Beer>> _loadedBeerPages = [];

  HomeScreenBeerListBloc() : super(HomeScreenBeerListInitial()) {
    on<HomeScreenBeerListFetched>((event, emit) async {
      List<Beer> beers;
      if (state is HomeScreenBeerListInitial) {
        beers = await Repository()
            .fetchBeerList()
            .timeout(const Duration(milliseconds: 5000), onTimeout: () {
          beers = [];
          emit(const HomeScreenBeerListError(
              'The beer list was not loaded.\n\nCheck your internet connection and try again.'));
          return beers;
        });
        if (beers.isNotEmpty) {
          _loadedBeerPages.add(beers);
          emit(HomeScreenBeerListLoaded(beers: beers));
        }
      } else if (state is HomeScreenBeerListLoaded) {
        final loadedBeerList = state as HomeScreenBeerListLoaded;
        final loadedPagesCount = _loadedBeerPages.length;
        beers = await Repository().fetchBeerList(loadedPagesCount + 1);
        if (beers.isNotEmpty) {
          _loadedBeerPages.add(beers);
          emit(HomeScreenBeerListLoaded.copyWith(
              loadedBeerList.beers + beers, loadedPagesCount + 1));
        }
      }
    });
  }
}
