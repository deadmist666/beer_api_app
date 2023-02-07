import 'package:flutter/material.dart';

import 'package:beer_api_app/models/beer_details.dart';
import 'package:beer_api_app/ui/widgets/beer_card.dart';
import 'package:beer_api_app/ui/widgets/home_screen_appbar.dart';
import 'package:beer_api_app/ui/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            ));
          }),
      floatingActionButton: FloatingActionButton.large(
          backgroundColor: ColorPalette.primaryBrown,
          child: Text(
            'Random beer',
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            print('tapped');
          }),
    );
  }
}
