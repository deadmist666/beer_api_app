import 'package:flutter/material.dart';

import 'package:beer_api_app/ui/widgets/home_screen_appbar.dart';
import 'package:beer_api_app/ui/widgets/home_screen_body.dart';
import 'package:beer_api_app/ui/widgets/home_screen_floating_action_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppBar(),
      body: HomeScreenBody(),
      floatingActionButton: HomeScreenFloatingActionButton(),
    );
  }
}
