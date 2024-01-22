import 'package:a_chat/util/constants/colors.dart';
import 'package:flutter/material.dart';

class AFloatingActionButtonTheme {
  /// Light FloatingActionButton
  static const FloatingActionButtonThemeData lightFloatingBtn =
      FloatingActionButtonThemeData(
          elevation: 10,
          backgroundColor: AColors.buttonPrimary,
          foregroundColor: AColors.white);

  /// Dark FloatingActionButton
  static const FloatingActionButtonThemeData darkFloatingBtn =
      FloatingActionButtonThemeData(
    elevation: 10,
    backgroundColor: AColors.buttonPrimary,
    foregroundColor: AColors.white,
  );
}
