import 'package:flutter/material.dart';

import 'package:beer_api_app/ui/utils/app_theme.dart';
import 'package:beer_api_app/models/beer_details.dart';
import 'package:beer_api_app/ui/utils/colors.dart';

class BeerDetailsScreen extends StatelessWidget {
  final Beer beer;

  const BeerDetailsScreen({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: const Text(
          'Beer Details',
          style: AppTheme.displayMedium,
        ),
        backgroundColor: ColorPalette.primaryLimedOak,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                beer.name,
                style: AppTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                beer.tagLine,
                style: AppTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 350,
                width: 150,
                child: Image(
                  image: NetworkImage(beer.image),
                  fit: BoxFit.scaleDown,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Description:',
                style: AppTheme.displaySmall,
              ),
              const SizedBox(height: 10),
              Text(
                beer.description,
                style: AppTheme.bodyMedium,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              const Text('Good with:', style: AppTheme.displaySmall),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: beer.foodPairing.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      child: Text(
                        ' — ${beer.foodPairing[index]}',
                        style: AppTheme.bodyMedium,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Made by ${beer.contributor.split('<')[0].trimRight()} for the first time on ${beer.firstBrewed}',
                style: AppTheme.titleSmall,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
