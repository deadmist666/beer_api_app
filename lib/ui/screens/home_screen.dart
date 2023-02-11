import 'package:flutter/material.dart';

import 'package:beer_api_app/ui/utils/app_theme.dart';
import 'package:beer_api_app/api/api_service.dart';
import 'package:beer_api_app/ui/screens/beer_details_screen.dart';
import 'package:beer_api_app/models/beer_details.dart';
import 'package:beer_api_app/ui/widgets/beer_card.dart';
import 'package:beer_api_app/ui/widgets/home_screen_appbar.dart';
import 'package:beer_api_app/ui/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();

  List<Map<String, dynamic>> beerJsonList = [];
  int page = 1;

  @override
  void initState() {
    getJsonBeerList(page);
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        getJsonBeerList(page);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppBar(),
      body: ListView.builder(
          controller: controller,
          itemCount: beerJsonList.length,
          itemBuilder: (context, index) {
            return BeerCard(beer: Beer.fromJson(beerJsonList[index]));
          }),
      floatingActionButton: FloatingActionButton.large(
          backgroundColor: ColorPalette.primaryLimedOak,
          child: Text(
            'Random beer',
            textAlign: TextAlign.center,
            style: AppTheme.labelMedium,
          ),
          onPressed: () async {
            final beer = await ApiService().fetchRandomBeer();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BeerDetailsScreen(beer: beer),
              ),
            );
          }),
    );
  }

  void getJsonBeerList(int index) async {
    List<dynamic> data = await ApiService().fetchBeerList(index);
    for (int i = 0; i < data.length; i++) {
      beerJsonList.add(data[i]);
    }
    setState(() {
      page++;
    });
  }
}
