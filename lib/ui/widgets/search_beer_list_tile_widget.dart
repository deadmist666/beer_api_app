import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:beer_api_app/models/beer_details.dart';
import 'package:beer_api_app/models/opened_beers_model.dart';
import 'package:beer_api_app/ui/screens/beer_details_screen.dart';
import 'package:beer_api_app/ui/utils/app_theme.dart';

class SearchBeerListView extends StatelessWidget {
  final List<Beer> beers;

  const SearchBeerListView({Key? key, required this.beers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beerHistoryList = Provider.of<OpenedBeersModel>(context);
    return ListView.builder(
      itemCount: beers.length,
      itemBuilder: (context, index) {
        return ListTile(
          trailing: Icon(Icons.arrow_back_ios),
          title: Text(
            beers[index].name,
            style: AppTheme.displaySmall,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BeerDetailsScreen(beer: beers[index]),
              ),
            );
            beerHistoryList.addOpenedBeerToHistory(beers[index]);
          },
        );
      },
    );
  }
}
