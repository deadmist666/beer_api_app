import 'package:flutter/material.dart';

import 'package:beer_api_app/ui/utils/colors.dart';

class AppTheme {
  static const textTheme = TextTheme(
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    displaySmall: displaySmall,
    titleLarge: titleLarge,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
    bodyMedium: bodyMedium,
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    bodySmall: bodySmall,
  );

  static const displayLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: ColorPalette.primaryBlack,
  );
  static const displayMedium = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: ColorPalette.primaryWhite,
  );
  static const displaySmall = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: ColorPalette.primaryBlack,
  );

  static const titleLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: ColorPalette.primaryBlack,
  );

  static const titleMedium = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: ColorPalette.primaryLimedOak,
  );

  static const titleSmall = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: ColorPalette.secondarySolidPink,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: ColorPalette.primaryBlack,
  );

  static const bodySmall = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: ColorPalette.secondaryWaikawaGray,
  );

  static const labelLarge = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 22,
    letterSpacing: 0.24,
    color: ColorPalette.primaryWhite,
  );

  static const labelMedium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.2,
    color: ColorPalette.primaryWhite,
  );
}
