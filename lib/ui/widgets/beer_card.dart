import 'package:flutter/material.dart';

import 'package:beer_api_app/ui/screens/beer_details_screen.dart';
import 'package:beer_api_app/models/beer_details.dart';

class BeerCard extends StatelessWidget {
  final Beer beer;

  const BeerCard({
    Key? key,
    required this.beer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Colors.grey,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 120,
              width: 150,
              child: Image(
                image: beer.image,
                fit: BoxFit.fill,
              ),
            ),
            Text(beer.name),
            Text(beer.description),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BeerDetailsScreen(
              beer: beer,
            ),
          ),
        );
      },
    );
  }
}
