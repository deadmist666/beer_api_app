import 'package:flutter/material.dart';

import 'package:beer_api_app/ui/utils/app_theme.dart';
import 'package:beer_api_app/ui/utils/colors.dart';
import 'package:beer_api_app/ui/screens/search_screen.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: const Text(
          'Beer list',
          style: AppTheme.displayMedium,
        ),
        backgroundColor: ColorPalette.primaryLimedOak,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}
