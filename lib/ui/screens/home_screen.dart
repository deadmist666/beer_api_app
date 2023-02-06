import 'package:beer_api_app/ui/models/beer_container.dart';
import 'package:beer_api_app/ui/models/homescreen_appbar.dart';
import 'package:beer_api_app/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
            itemCount: fooBeer.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(height: 20),
                  BeerContainer(
                    image: fooBeer[index].image,
                    description: fooBeer[index].description,
                  ),
                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton.large(
          backgroundColor: primaryBrown,
          child: Text('Random beer', textAlign: TextAlign.center,),
          onPressed: () {
            print('tapped');
          }),
    );
  }
}
