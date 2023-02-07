import 'package:flutter/cupertino.dart';

import 'package:beer_api_app/ui/screens/home_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

Widget splashScreen = AnimatedSplashScreen(
  splash: Text(
    'Pivko',
    style: TextStyle(fontSize: 32),
  ),
  nextScreen: HomeScreen(),
  duration: 3000,
);
