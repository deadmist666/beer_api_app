import 'package:beer_api_app/api/api_service.dart';
import 'package:beer_api_app/models/beer_details.dart';

class Repository {

  Future<Beer> fetchRandomBeer() async {
    final splashBeer = await ApiService().fetchRandomBeer();
    Beer beer = Beer.fromJson(splashBeer[0]);
    return beer;
  }

  Future<List<Beer>> fetchBeerList(int index) async {
    final beerList = await ApiService().fetchBeerList(index);
    return beerList.map((e) => Beer.fromJson(e)).toList();
  }

  Future<List<Beer>> fetchBeerSearchResult(String query) async {
    final searchResults = await ApiService().fetchSearchResult(query);
    return searchResults.map((e) => Beer.fromJson(e)).toList();
  }
}
