import 'package:flutter/material.dart';

import 'dart:math';

import 'package:beer_api_app/ui/screens/beer_details_screen.dart';
import 'package:beer_api_app/models/beer_details.dart';
import 'package:beer_api_app/ui/widgets/beer_card.dart';
import 'package:beer_api_app/ui/widgets/home_screen_appbar.dart';
import 'package:beer_api_app/ui/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Beer get randomBeer => fooBeer[Random().nextInt(fooBeer.length - 1)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppBar(),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: fooBeer.length,
          itemBuilder: (context, index) {
            return BeerCard(
                beer: Beer(
              name: fooBeer[index].name,
              description: fooBeer[index].description,
              image: fooBeer[index].image,
              tagLine: fooBeer[index].tagLine,
              firstBrewed: fooBeer[index].firstBrewed,
            ));
          }),
      floatingActionButton: FloatingActionButton.large(
          backgroundColor: ColorPalette.primaryBrown,
          child: Text(
            'Random beer',
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BeerDetailsScreen(beer: randomBeer)));
            print('tapped');
          }),
    );
  }
}
