import 'dart:convert';

import 'package:http/http.dart';
import 'package:beer_api_app/models/beer_details.dart';

class ApiService {
  final String randomBeerUrl = 'https://api.punkapi.com/v2/beers/random';

  String beerListUrl(int index) {
    return 'https://api.punkapi.com/v2/beers?page=${index.toString()}&per_page=5';
  }

  String beerNameUrl(String name) {
    return 'https://api.punkapi.com/v2/beers?beer_name=$name';
  }

  Future<Beer> fetchRandomBeer() async {
    final response = await get(Uri.parse(randomBeerUrl));
    List<dynamic> parsedJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Beer.fromJson(parsedJson[0]);
    } else {
      throw Exception('Failed to load Beer');
    }
  }

  Future<List<dynamic>> fetchBeerList(int index) async {
    final response = await get(Uri.parse(beerListUrl(index)));
    List<dynamic> parsedJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return parsedJson;
    } else {
      throw Exception('Failed to load Beer');
    }
  }

  Future<List<Beer>> fetchSearchResult(String name) async {
    final response = await get(Uri.parse(beerNameUrl(name)));
    List<dynamic> parsedJson = jsonDecode(response.body);
    List<Beer> beerList = [];
    if (response.statusCode == 200) {
      for (var item in parsedJson) {
        Beer beer = Beer.fromJson(item);
        beerList.add(beer);
      }
      return beerList;
    } else {
      throw Exception('Failed to load Beer');
    }
  }
}
