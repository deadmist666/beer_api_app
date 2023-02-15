import 'package:flutter/material.dart';


import 'package:beer_api_app/repositories/beer_repository.dart';
import 'package:beer_api_app/ui/utils/app_theme.dart';
import 'package:beer_api_app/ui/screens/home_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:beer_api_app/models/beer_details.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: FutureBuilder(
            future: Repository().fetchRandomBeer(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final Beer beer = snapshot.data!;
                return Image.network(
                  beer.image
                );
              }
              return LinearProgressIndicator();
            }),
        nextScreen: HomeScreen(),
        centered: true,
        duration: 4500,
        splashIconSize: 500,
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Beer of the day!',
            style: AppTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
