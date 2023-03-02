import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData theme = ThemeData(
    iconTheme: const IconThemeData(color: kcPrimaryColor),
    primaryColor: kcPrimaryColor,
    primarySwatch: const MaterialColor(
      _primaryColorValue,
      <int, Color>{
        50: Color(0xFFB6BDE7),
        100: Color(0xFF9DA7DE),
        200: Color(0xFF8591D6),
        300: Color(0xFF6D7BCE),
        400: Color(0xFF5465C6),
        500: Color(_primaryColorValue),
        600: Color(0xFF3747A4),
        700: Color(0xFF2F3D8D),
        800: Color(0xFF273375),
        900: Color(0xFF1F295E),
      },
    ),
  );
}

const int _primaryColorValue = 0xFF3e52bc;
