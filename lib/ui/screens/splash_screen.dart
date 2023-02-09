import 'package:flutter/material.dart';

import 'package:beer_api_app/ui/utils/app_theme.dart';
import 'package:beer_api_app/api/api_service.dart';
import 'package:beer_api_app/ui/screens/home_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: FutureBuilder(
            future: ApiService().fetchRandomBeer(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Image.network(
                  snapshot.data!.image,
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
