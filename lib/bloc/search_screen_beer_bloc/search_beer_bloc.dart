import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:beer_api_app/models/beer_details.dart';
import 'package:beer_api_app/models/opened_beers_model.dart';
import 'package:beer_api_app/repositories/beer_repository.dart';

part 'search_beer_event.dart';

part 'search_beer_state.dart';

class SearchBeerBloc extends Bloc<SearchBeerEvent, SearchBeerState> {
  final OpenedBeersModel _openedBeersModel;

  SearchBeerBloc(this._openedBeersModel) : super(SearchBeerInitial()) {
    List<Beer> beerListHistory = _openedBeersModel.openedBeersHistory;

    on<SearchBeerChangedQuery>((event, emit) async {
      final query = await event.query;
      if (query.isNotEmpty) {
        emit(SearchBeerLoading());
        final beers = await searchBeer(query);
        if (beers.isEmpty) {
          emit(SearchBeerError('Beer not found'));
        } else {
          emit(SearchBeerLoaded(beers: beers));
        }
      } else {
        emit(SearchBeerHistoryInitial(beerListHistory));
      }
    });

    on<SearchBeerClearedQuery>((event, emit) async {
      if (beerListHistory.isNotEmpty) {
        emit(SearchBeerHistoryInitial(beerListHistory));
      } else {
        emit(SearchBeerInitial());
      }
    });
  }

  Future<List<Beer>> searchBeer(String query) async {
    final beers = await Repository().fetchBeerSearchResult(query);
    return await beers;
  }
}
