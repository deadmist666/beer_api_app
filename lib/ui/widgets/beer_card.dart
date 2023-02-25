import 'package:flutter/material.dart';

import 'package:beer_api_app/ui/utils/app_theme.dart';
import 'package:beer_api_app/ui/utils/colors.dart';
import 'package:beer_api_app/ui/screens/beer_details_screen.dart';
import 'package:beer_api_app/models/beer_details.dart';

class BeerCard extends StatelessWidget {
  final Beer beer;

  const BeerCard({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: ColorPalette.primaryWhite,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          side: BorderSide(
            color: ColorPalette.primaryBlack,
            width: 1.5,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 100,
              child: Image(
                image: NetworkImage(beer.image, scale: 7.5),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beer.name,
                    style: AppTheme.displaySmall,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    beer.tagLine,
                    style: AppTheme.titleMedium,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    beer.firstBrewed,
                    style: AppTheme.titleSmall,
                  ),
                ],
              ),
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
