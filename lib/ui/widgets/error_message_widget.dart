import 'package:flutter/material.dart';

import 'package:beer_api_app/ui/utils/app_theme.dart';

class ErrorMessage extends StatelessWidget {
  final String errorMessage;

  const ErrorMessage({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: AppTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
