import 'dart:async';

import 'package:flutter/material.dart';

import 'package:beer_api_app/repositories/beer_repository.dart';
import 'package:beer_api_app/ui/screens/beer_details_screen.dart';
import 'package:beer_api_app/ui/utils/app_theme.dart';
import 'package:beer_api_app/ui/utils/colors.dart';

class HomeScreenFloatingActionButton extends StatefulWidget {
  const HomeScreenFloatingActionButton({Key? key}) : super(key: key);

  @override
  State<HomeScreenFloatingActionButton> createState() =>
      _HomeScreenFloatingActionButtonState();
}

class _HomeScreenFloatingActionButtonState
    extends State<HomeScreenFloatingActionButton> {
  bool isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
        backgroundColor: ColorPalette.primaryLimedOak,
        onPressed: isButtonDisabled
            ? null
            : () async {
                setState(() => isButtonDisabled = true);
                Timer(const Duration(seconds: 2), () {
                  setState(() => isButtonDisabled = false);
                });
                final beer = await Repository().fetchRandomBeer();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BeerDetailsScreen(beer: beer),
                  ),
                );
              },
        child: const Text(
          'Random beer',
          textAlign: TextAlign.center,
          style: AppTheme.labelMedium,
        ));
  }
}
