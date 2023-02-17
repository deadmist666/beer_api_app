import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:beer_api_app/models/beer_details.dart';
import 'package:beer_api_app/repositories/beer_repository.dart';

part 'beer_event.dart';

part 'beer_state.dart';

class BeerBloc extends Bloc<BeerEvent, BeerState> {
  BeerBloc() : super(BeerInitial()) {
    on<BeerFetched>((event, emit) async {
      List<Beer> beers;
      try {
        if (state is BeerInitial) {
          beers = await Repository().fetchBeerList();
          emit(BeerLoaded(beers: beers));
        } else {
          BeerLoaded beerLoaded = state as BeerLoaded;
          beers = await Repository().fetchBeerList(beerLoaded.beers.length);
          emit(BeerLoaded.copyWith(beerLoaded.beers + beers));
        }
      } catch (_) {
        emit(BeerError());
      }
    });
  }
}
