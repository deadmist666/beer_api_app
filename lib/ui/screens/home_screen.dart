import 'package:beer_api_app/ui/utils/colors.dart';
import '../widgets/beer_container.dart';
import '../widgets/home_screen_appbar.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppBar(),
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
          backgroundColor: ColorPalette.primaryBrown,
          child: Text('Random beer', textAlign: TextAlign.center,),
          onPressed: () {
            print('tapped');
          }),
    );
  }
}
