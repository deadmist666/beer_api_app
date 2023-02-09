import 'package:flutter/material.dart';

import 'package:beer_api_app/ui/utils/colors.dart';

class AppTheme {
  static final textTheme = TextTheme(
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
    bodyMedium: bodyMedium,
    labelMedium: labelMedium,
    bodySmall: bodySmall,
  );

  static final displayLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: ColorPalette.primaryBlack,
  );
  static final displayMedium = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: ColorPalette.primaryBlack,
  );

  static final titleMedium = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: ColorPalette.primaryLimedOak,
  );

  static final titleSmall = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: ColorPalette.secondarySolidPink,
  );

  static final TextStyle bodyMedium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: ColorPalette.primaryBlack,
  );

  static final bodySmall = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: ColorPalette.secondaryWaikawaGray,
  );

  static final labelMedium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: ColorPalette.primaryWhite,
  );
}