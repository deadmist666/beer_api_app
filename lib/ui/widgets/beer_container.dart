import 'package:flutter/material.dart';

class BeerContainer extends StatelessWidget {
  final String image;
  final String description;

  const BeerContainer({
    Key? key,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: EdgeInsets.all(60),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(image),
          Text(description),
        ],
      ),
    );
  }
}

List<BeerContainer> fooBeer = [
  BeerContainer(image: 'image', description: 'description'),
  BeerContainer(image: 'image1', description: 'description1'),
  BeerContainer(image: 'image2', description: 'description2'),
];
