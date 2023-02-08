import 'dart:convert';

import 'package:http/http.dart';
import 'package:beer_api_app/models/beer_details.dart';

class ApiService {
  final String randomBeerUrl = 'https://api.punkapi.com/v2/beers/random';

  Future<Beer> fetchSplashRandomBeer() async {
    final response = await get(Uri.parse(randomBeerUrl));
    dynamic parsedJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Beer.fromJson(parsedJson[0]);
    } else {
      throw Exception('Failed to load Beer');
    }
  }
}