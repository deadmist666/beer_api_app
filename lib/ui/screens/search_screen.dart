import 'package:flutter/material.dart';

import 'dart:async';

import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:beer_api_app/bloc/search_screen_beer_bloc/search_beer_bloc.dart';
import 'package:beer_api_app/ui/widgets/search_beer_list_tile_widget.dart';
import 'package:beer_api_app/ui/widgets/error_message_widget.dart';
import 'package:beer_api_app/models/opened_beers_model.dart';
import 'package:beer_api_app/ui/widgets/loading_widget.dart';
import 'package:beer_api_app/ui/utils/app_theme.dart';
import 'package:beer_api_app/ui//utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchBeerBloc beerBloc;
  final textController = TextEditingController();
  Timer? debounceTimer;

  @override
  void initState() {
    super.initState();
    beerBloc = context.read<SearchBeerBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final beerHistory =
        Provider.of<OpenedBeersModel>(context).openedBeersHistory;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textController,
          onChanged: onSearchChanged,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              color: ColorPalette.primaryWhite,
              icon: Icon(
                Icons.backspace_outlined,
                size: 25,
              ),
              onPressed: () {
                textController.clear();
                beerBloc.add(SearchBeerClearedQuery());
              },
            ),
            hintText: 'Search beer',
            hintStyle: AppTheme.labelLarge,
            border: InputBorder.none,
          ),
          autofocus: true,
          textAlignVertical: TextAlignVertical.center,
          style: AppTheme.labelLarge,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_outlined,
            size: 25,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 60,
        backgroundColor: ColorPalette.primaryLimedOak,
      ),
      body: BlocBuilder<SearchBeerBloc, SearchBeerState>(
          bloc: beerBloc,
          builder: (context, state) {
            if (state is SearchBeerInitial) {
              return SearchBeerListView(beers: beerHistory);
            } else if (state is SearchBeerHistoryInitial) {
              return SearchBeerListView(beers: beerHistory);
            } else if (state is SearchBeerLoading) {
              return LoadingIndicator();
            } else if (state is SearchBeerLoaded) {
              return SearchBeerListView(beers: state.beers!);
            } else if (state is SearchBeerError) {
              return ErrorMessage(errorMessage: state.errorMessage);
            } else {
              return ErrorMessage(errorMessage: 'Unexpected error');
            }
          }),
    );
  }

  void onSearchChanged(String query) {
    if (debounceTimer?.isActive ?? false) {
      debounceTimer!.cancel();
    }
    debounceTimer = Timer(Duration(milliseconds: 300), () {
      if (query.isNotEmpty) {
        beerBloc.add(SearchBeerChangedQuery(query));
      } else {
        beerBloc.add(SearchBeerClearedQuery());
      }
    });
  }

  @override
  void dispose() {
    textController.dispose();
    debounceTimer?.cancel();
    super.dispose();
  }
}
