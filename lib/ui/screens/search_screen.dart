import 'dart:async';

import 'package:flutter/material.dart';

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
  late final SearchBeerBloc _beerBloc;
  final TextEditingController _textController = TextEditingController();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _beerBloc = context.read<SearchBeerBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final beerHistory =
        Provider.of<OpenedBeersModel>(context).openedBeersHistory;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _textController,
          onChanged: onSearchChanged,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              color: ColorPalette.primaryWhite,
              icon: const Icon(
                Icons.backspace_outlined,
                size: 25,
              ),
              onPressed: () {
                _textController.clear();
                _beerBloc.add(SearchBeerClearedQuery());
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
          icon: const Icon(
            Icons.arrow_back_outlined,
            size: 25,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 60,
        backgroundColor: ColorPalette.primaryLimedOak,
      ),
      body: BlocBuilder<SearchBeerBloc, SearchBeerState>(
          bloc: _beerBloc,
          builder: (context, state) {
            switch (state.runtimeType) {
              case SearchBeerInitial:
              case SearchBeerHistoryInitial:
                return SearchBeerListView(beers: beerHistory);
              case SearchBeerLoading:
                return const LoadingIndicator();
              case SearchBeerLoaded:
                return SearchBeerListView(
                    beers: (state as SearchBeerLoaded).beers!);
              case SearchBeerError:
                return ErrorMessage(
                    errorMessage: (state as SearchBeerError).errorMessage);
              default:
                return const ErrorMessage(errorMessage: 'Unexpected error');
            }
          }),
    );
  }

  void onSearchChanged(String query) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 350), () {
      if (query.isNotEmpty) {
        _beerBloc.add(SearchBeerChangedQuery(query));
      } else {
        _beerBloc.add(SearchBeerClearedQuery());
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }
}
