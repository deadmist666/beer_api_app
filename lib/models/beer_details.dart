import 'package:flutter/cupertino.dart';

class Beer {
  final String name;
  final String description;
  final NetworkImage image;

  const Beer(
      {required this.name, required this.description, required this.image});
}

List<Beer> fooBeer = [
  Beer(
      name: 'Beer',
      description: 'description',
      image: NetworkImage(
        'https://images.unsplash.com/photo-1608270586620-248524c67de9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80',
      )),
  Beer(
      name: 'Beer1',
      description: 'description1',
      image: NetworkImage(
        'https://images.unsplash.com/photo-1608270586620-248524c67de9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80',
      )),
  Beer(
      name: 'Beer2',
      description: 'description2',
      image: NetworkImage(
        'https://images.unsplash.com/photo-1608270586620-248524c67de9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80',
      )),
];
