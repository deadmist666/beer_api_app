import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:beer_api_app/ui/screens/homescreen.dart';
import 'package:flutter/cupertino.dart';

Widget splashScreen = AnimatedSplashScreen(
  splash: Text('Pivko', style: TextStyle(fontSize: 32),), nextScreen: HomeScreen(),
  duration: 3000,
);
