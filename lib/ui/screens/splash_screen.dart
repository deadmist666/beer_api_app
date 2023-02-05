import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:beer_api_app/main.dart';
import 'package:flutter/cupertino.dart';

Widget splashScreen = AnimatedSplashScreen(
  splash: Text('FOO', style: TextStyle(fontSize: 32),), nextScreen: MyHomePage(),
  duration: 3000,
);
