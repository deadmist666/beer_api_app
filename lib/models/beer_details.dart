import 'package:flutter/cupertino.dart';

@immutable
class Beer {
  final String name;
  final String description;
  final String image;
  final String firstBrewed;
  final String tagLine;
  final List<dynamic> foodPairing;
  final String contributor;

  const Beer({
    required this.name,
    required this.tagLine,
    required this.firstBrewed,
    required this.description,
    required this.image,
    required this.foodPairing,
    required this.contributor,
  });

  factory Beer.fromJson(Map<String, dynamic> json) {
    return Beer(
      name: json['name'] ?? 'No data',
      tagLine: json['tagline'] ?? 'No data',
      firstBrewed: json['first_brewed'] ?? 'No data',
      description: json['description'] ?? 'No data',
      image: json['image_url'] ?? 'https://images.punkapi.com/v2/15.png',
      foodPairing: json['food_pairing'] ?? 'No data',
      contributor: json['contributed_by'] ?? 'No data',
    );
  }
}
