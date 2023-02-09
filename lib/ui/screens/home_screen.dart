import 'package:flutter/material.dart';

import 'dart:math';

import 'package:beer_api_app/ui/utils/app_theme.dart';
import 'package:beer_api_app/api/api_service.dart';
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
      body: FutureBuilder(
        future: ApiService().fetchBeerList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> beerList = snapshot.data!;
            return ListView.builder(
                itemCount: beerList.length,
                itemBuilder: (context, index) {
                  dynamic beer = beerList[index];
                  return BeerCard(beer: Beer.fromJson(beer));
                });
          } else
            return LinearProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton.large(
          backgroundColor: ColorPalette.primaryLimedOak,
          child: Text(
            'Random beer',
            textAlign: TextAlign.center,
            style: AppTheme.labelMedium,
          ),
          onPressed: () async{
           final beer = await ApiService().fetchRandomBeer();
           Navigator.push(context, MaterialPageRoute(builder: (context) => BeerDetailsScreen(beer: beer)));
           print('tapped');
          }),
    );
  }
}
