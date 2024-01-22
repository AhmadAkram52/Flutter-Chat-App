import 'package:a_chat/util/theme/widgets%20themes/appbar_theme.dart';
import 'package:a_chat/util/theme/widgets%20themes/floatingactionbutton_theme.dart';
import 'package:flutter/material.dart';

class ATheme {
  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: AAppBar.lightAppBar,
    floatingActionButtonTheme: AFloatingActionButtonTheme.lightFloatingBtn,
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: AAppBar.darkAppBar,
    floatingActionButtonTheme: AFloatingActionButtonTheme.darkFloatingBtn,
  );
}
