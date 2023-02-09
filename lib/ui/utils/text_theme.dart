import 'dart:ui';

import 'package:beer_api_app/ui/utils/colors.dart';

class TextTheme {
  static final display = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: ColorPalette.primaryBlack,
  );
  static final headline = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: ColorPalette.primaryBlack,
  );

  static final title = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: ColorPalette.primaryLimedOak,
  );

  static final subtitle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: ColorPalette.secondarySolidPink,
  );

  static final TextStyle body1 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: ColorPalette.secondaryWaikawaGray,
  );

  static final body2 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: ColorPalette.primaryBlack,
  );
}
