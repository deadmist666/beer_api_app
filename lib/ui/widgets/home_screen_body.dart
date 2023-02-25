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

class _HomeScreenBodyState extends State<HomeScreenBody>
    with AutomaticKeepAliveClientMixin<HomeScreenBody> {
  final ScrollController _controller = ScrollController();
  late final HomeScreenBeerListBloc _beerBloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _beerBloc = context.read<HomeScreenBeerListBloc>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _controller.addListener(_onScroll);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<HomeScreenBeerListBloc, HomeScreenBeerListState>(
      bloc: _beerBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeScreenBeerListInitial:
            return LoadingIndicator();
          case HomeScreenBeerListLoaded:
            final beers = (state as HomeScreenBeerListLoaded).beers;
            if (beers.isEmpty) {
              return const Center(child: Text('No beer'));
            }
            return ListView.builder(
              controller: _controller,
              itemCount: beers.length + 1,
              itemBuilder: (context, index) {
                if (index >= beers.length) {
                  return LinearProgressIndicator();
                }
                return BeerCard(beer: beers[index]);
              },
            );
          case HomeScreenBeerListError:
            final errorMessage =
                (state as HomeScreenBeerListError).errorMessage;
            return ErrorMessage(errorMessage: errorMessage);
          default:
            return ErrorMessage(errorMessage: 'Unexpected error');
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.position.pixels;
    if (currentScroll == maxScroll) {
      _beerBloc.add(HomeScreenBeerListFetched());
    }
  }
}
