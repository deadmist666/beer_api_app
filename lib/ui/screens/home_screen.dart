import 'package:flutter/material.dart';

import 'package:beer_api_app/api/api_service.dart';
import 'package:beer_api_app/ui/widgets/home_screen_appbar.dart';
import 'package:beer_api_app/ui/widgets/home_screen_body.dart';
import 'package:beer_api_app/ui/screens/beer_details_screen.dart';
import 'package:beer_api_app/ui/utils/colors.dart';
import 'package:beer_api_app/ui/utils/app_theme.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppBar(),
      body: HomeScreenBody(),
      floatingActionButton: FloatingActionButton.large(
          backgroundColor: ColorPalette.primaryLimedOak,
          child: Text(
            'Random beer',
            textAlign: TextAlign.center,
            style: AppTheme.labelMedium,
          ),
          onPressed: () async {
            final beer = await ApiService().fetchRandomBeer();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BeerDetailsScreen(beer: beer),
              ),
            );
          }),
    );
  }
}
