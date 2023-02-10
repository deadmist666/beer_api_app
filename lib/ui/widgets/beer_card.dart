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
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          side: BorderSide(color: Colors.black)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 100,
              child: Image(
                image: NetworkImage(beer.image),
                fit: BoxFit.scaleDown,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(beer.name),
                Text(beer.tagLine),
              ],
            ),
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
