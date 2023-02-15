import 'package:flutter/material.dart';

import 'package:beer_api_app/repositories/beer_repository.dart';
import 'package:beer_api_app/models/beer_details.dart';
import 'package:beer_api_app/ui/screens/beer_details_screen.dart';
import 'package:beer_api_app/ui/utils/app_theme.dart';
import 'package:beer_api_app/ui//utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();

  List<Beer> beerList = [];
  List<Beer> filteredBeerList = [];
  List<Beer> openedBeerHistory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: TextField(
          textAlignVertical: TextAlignVertical.center,
          style: AppTheme.labelMedium,
          autofocus: true,
          controller: textController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              color: ColorPalette.primaryWhite,
              icon: Icon(
                Icons.backspace_outlined,
              ),
              onPressed: () {
                setState(() {
                  textController.clear();
                  filteredBeerList.clear();
                });
              },
            ),
            hintText: 'Search beer',
            hintStyle: AppTheme.labelMedium,
            border: InputBorder.none,
          ),
          onChanged: (value) => filterBeerListBySearchQuery(value),
          onSubmitted: (value) => filterBeerListBySearchQuery(value),
        ),
        backgroundColor: ColorPalette.primaryLimedOak,
      ),
      body: StreamBuilder(
          stream: Repository()
              .fetchBeerSearchResult(textController.text)
              .asStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                controller: scrollController,
                itemCount: filteredBeerList.length,
                itemBuilder: (context, index) {
                  Beer beer = filteredBeerList[index];
                  return ListTile(
                    trailing: Icon(Icons.arrow_back_ios),
                    title: Text(
                      beer.name,
                      style: AppTheme.displaySmall,
                    ),
                    onTap: () {
                      beerHistoryService(beer);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BeerDetailsScreen(beer: beer),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (textController.text.isEmpty) {
              return ListView.builder(
                  itemCount: openedBeerHistory.length,
                  itemBuilder: (context, index) {
                    Beer beer = openedBeerHistory[index];
                    return ListTile(
                      trailing: Icon(Icons.arrow_back_ios),
                      title: Text(
                        beer.name,
                        style: AppTheme.displaySmall,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BeerDetailsScreen(beer: beer),
                          ),
                        );
                      },
                    );
                  });
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No results found.'),
                ],
              );
            }
          }),
    );
  }

  void filterBeerListBySearchQuery(String query) async {

    beerList = await Repository().fetchBeerSearchResult(query);

    setState(() {
      filteredBeerList = beerList
          .where(
              (beer) => beer.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void beerHistoryService(Beer beer) {
    if (openedBeerHistory.length > 6) {
      openedBeerHistory.removeLast();
    } else {
      openedBeerHistory.insert(0, beer);
    }
  }
}
