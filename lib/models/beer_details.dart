import 'package:flutter/cupertino.dart';

@immutable
class Beer {
  late final String name;
  late final String description;
  late final String image;
  late final String firstBrewed;
  late final String tagLine;

  Beer({
    required this.name,
    required this.tagLine,
    required this.firstBrewed,
    required this.description,
    required this.image,
  });

  factory Beer.fromJson(Map<String, dynamic> json) {
    return Beer(
      name: json['name'] ?? 'No data',
      tagLine: json['tagline'] ?? 'No data',
      firstBrewed: json['first_brewed'] ?? 'No data',
      description: json['description'] ?? 'No data',
      image: json['image_url'] ?? 'https://images.punkapi.com/v2/15.png',
    );
  }
}
