import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:beer_api_app/bloc/beer_bloc.dart';
import 'package:beer_api_app/ui/screens/splash_screen.dart';
import 'package:beer_api_app/ui/utils/app_theme.dart';
import 'package:beer_api_app/ui/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BeerBloc()..add(BeerFetched()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryIconTheme: IconThemeData(color: ColorPalette.primaryWhite),
          textTheme: AppTheme.textTheme,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
