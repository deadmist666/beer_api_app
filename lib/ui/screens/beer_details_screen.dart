import 'package:flutter/material.dart';

import 'package:beer_api_app/models/beer_details.dart';
import 'package:beer_api_app/ui/utils/colors.dart';

class BeerDetailsScreen extends StatelessWidget {
  final Beer beer;

  const BeerDetailsScreen({
    Key? key,
    required this.beer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: Text('Beer Details'),
        backgroundColor: ColorPalette.primaryBrown,
      ),
      body: Column(
        children: [
          Text(beer.image),
          Text(beer.name),
          Text(beer.description),
        ],
      ),
    );
  }
}
