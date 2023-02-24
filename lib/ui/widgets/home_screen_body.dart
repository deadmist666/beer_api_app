import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:beer_api_app/bloc/home_screen_beer_list_bloc/home_beer_bloc.dart';
import 'package:beer_api_app/ui/widgets/beer_card.dart';
import 'package:beer_api_app/ui/widgets/loading_widget.dart';
import 'package:beer_api_app/ui/widgets/error_message_widget.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late HomeScreenBeerListBloc beerBloc;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    controller.addListener(onScroll);
    beerBloc = context.read<HomeScreenBeerListBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBeerListBloc, HomeScreenBeerListState>(
        bloc: beerBloc,
        builder: (context, state) {
          if (state is HomeScreenBeerListInitial) {
            return LoadingIndicator();
          }
          if (state is HomeScreenBeerListLoaded) {
            if (state.beers.isEmpty) {
              return Center(child: Text('No beer'));
            }
            return ListView.builder(
                controller: controller,
                itemCount: state.beers.length + 1,
                itemBuilder: (context, index) {
                  if (index >= state.beers.length)
                    return LinearProgressIndicator();
                  return BeerCard(beer: state.beers[index]);
                });
          } else if (state is HomeScreenBeerListError) {
            return ErrorMessage(errorMessage: state.errorMessage);
          } else {
            return ErrorMessage(errorMessage: 'Unexpected error');
          }
        });
  }

  @override
  void dispose() {
    controller.removeListener(onScroll);
    super.dispose();
  }

  void onScroll() {
    final maxScroll = controller.position.maxScrollExtent;
    final currentScroll = controller.position.pixels;
    if (currentScroll == maxScroll) {
      beerBloc.add(HomeScreenBeerListFetched());
    }
  }
}
