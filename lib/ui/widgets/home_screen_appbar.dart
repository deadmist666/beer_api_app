import 'package:flutter/material.dart';

import 'package:beer_api_app/api/api_service.dart';
import 'package:beer_api_app/models/beer_details.dart';
import 'package:beer_api_app/ui/screens/beer_details_screen.dart';
import 'package:beer_api_app/ui/utils/app_theme.dart';
import 'package:beer_api_app/ui/utils/colors.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
          'Beer list',
          style: AppTheme.displayMedium,
        ),
        backgroundColor: ColorPalette.primaryLimedOak,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(hintText: 'Beer name'),
                );
              },
              icon: Icon(Icons.search))
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({
    required String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  final TextEditingController controller = TextEditingController();

  List<dynamic> searchResultsList = [];
  List<dynamic> openedBeerList = [];

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (openedBeerList.length > 5) {
      openedBeerList.remove(openedBeerList.first);
    }
    return ListView.builder(
        itemCount: openedBeerList.length,
        itemBuilder: (context, index) {
          Beer beer = Beer.fromJson(openedBeerList[index]);
          return ListTile(
            leading: Image(image: NetworkImage(beer.image)),
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
  }

  @override
  Widget buildResults(BuildContext context) {
    searchResultsList.clear();
    return FutureBuilder(
        future: ApiService().fetchSearchResult(query),
        builder: (context, snapshot) {
          List<dynamic>? beerList = snapshot.data;
          if (beerList != null &&
              snapshot.connectionState == ConnectionState.done) {
            for (dynamic item in beerList) {
              searchResultsList.add(item);
            }
            return ListView.builder(
              itemCount: searchResultsList.length,
              itemBuilder: (context, index) {
                Beer beer = Beer.fromJson(searchResultsList[index]);
                return ListTile(
                  leading: Image(image: NetworkImage(beer.image)),
                  trailing: Icon(Icons.arrow_back_ios),
                  title: Text(
                    beer.name,
                    style: AppTheme.displaySmall,
                  ),
                  onTap: () {
                    openedBeerList.add(beer);
                    searchResultsList.clear();
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
          } else if (query == '') {
            return buildSuggestions(context);
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: Icon(Icons.backspace_outlined),
      ),
    ];
  }
}
