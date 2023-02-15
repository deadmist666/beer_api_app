import 'package:flutter/material.dart';

import 'package:beer_api_app/repositories/beer_repository.dart';
import 'package:beer_api_app/models/beer_details.dart';
import 'package:beer_api_app/ui/widgets/beer_card.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  ScrollController controller = ScrollController();

  List<Beer> beerList = [];
  int page = 1;

  @override
  void initState() {
    getBeerList(page);
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        getBeerList(page);
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
    return ListView.builder(
        controller: controller,
        itemCount: beerList.length,
        itemBuilder: (context, index) {
          return BeerCard(beer: beerList[index]);
        });
  }

  void getBeerList(int index) async {
    List<Beer> loadedBeerList = await Repository().fetchBeerList(index);
    for (int i = 0; i < loadedBeerList.length; i++) {
      this.beerList.add(loadedBeerList[i]);
    }
    setState(() {
      page++;
    });
  }
}
