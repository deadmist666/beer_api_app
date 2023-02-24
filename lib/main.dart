import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:beer_api_app/bloc/search_screen_beer_bloc/search_beer_bloc.dart';
import 'package:beer_api_app/bloc/home_screen_beer_list_bloc/home_beer_bloc.dart';
import 'package:beer_api_app/models/opened_beers_model.dart';
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
        ChangeNotifierProvider(create: (_) => OpenedBeersModel()),
        BlocProvider(
          create: (_) =>
              HomeScreenBeerListBloc()..add(HomeScreenBeerListFetched()),
        ),
        BlocProvider(
          create: (_) => SearchBeerBloc(OpenedBeersModel()),
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
