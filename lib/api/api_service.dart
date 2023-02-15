import 'dart:convert';

import 'package:http/http.dart';

class ApiService {
  final String randomBeerUrl = 'https://api.punkapi.com/v2/beers/random';

  String beerListUrl(int index) {
    return 'https://api.punkapi.com/v2/beers?page=${index.toString()}&per_page=5';
  }

  String beerNameUrl(String name) {
    return 'https://api.punkapi.com/v2/beers?beer_name=$name';
  }

  Future<dynamic> fetchRandomBeer() async {
    final response = await get(Uri.parse(randomBeerUrl));
    List<dynamic> parsedJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return parsedJson;
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

  Future<List<dynamic>> fetchSearchResult(String query) async {
    final response = await get(Uri.parse(beerNameUrl(query)));
    List<dynamic> parsedJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return parsedJson;
    } else {
      throw Exception('Failed to load Beer');
    }
  }
}
