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

List<Beer> fooBeer = [
  Beer(
    name: 'Beer',
    tagLine: 'tagLine',
    firstBrewed: '12/03',
    description: 'description',
    image:
        'https://images.unsplash.com/photo-1608270586620-248524c67de9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80',
  ),
  Beer(
    name: 'Beer1',
    tagLine: 'tagLine1',
    firstBrewed: '03/10',
    description: 'description1',
    image:
        'https://images.unsplash.com/photo-1608270586620-248524c67de9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80',
  ),
  Beer(
    name: 'Beer2',
    tagLine: 'tagLine2',
    firstBrewed: '21/10',
    description: 'description2',
    image:
        'https://images.unsplash.com/photo-1608270586620-248524c67de9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80',
  ),
];
