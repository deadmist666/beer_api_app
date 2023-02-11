import 'package:flutter/material.dart';

import 'package:beer_api_app/api/api_service.dart';
import 'package:beer_api_app/models/beer_details.dart';
import 'package:beer_api_app/ui/widgets/beer_card.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
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
    return ListView.builder(
        controller: controller,
        itemCount: beerJsonList.length,
        itemBuilder: (context, index) {
          return BeerCard(beer: Beer.fromJson(beerJsonList[index]));
        });
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
