import 'package:a_chat/util/theme/widgets%20themes/appbar_theme.dart';
import 'package:a_chat/util/theme/widgets%20themes/elevated_button_theme.dart';
import 'package:a_chat/util/theme/widgets%20themes/floatingactionbutton_theme.dart';
import 'package:a_chat/util/theme/widgets%20themes/text_theme.dart';
import 'package:flutter/material.dart';

class ATheme {
  ATheme._(); // Void to creating instance of class

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: AAppBar.lightAppBar,
    floatingActionButtonTheme: AFloatingActionButtonTheme.lightFloatingBtn,
    textTheme: ATextTheme.lightTextTheme,
    elevatedButtonTheme: AElevatedBtnTheme.lightElevatedButton,
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: AAppBar.darkAppBar,
    floatingActionButtonTheme: AFloatingActionButtonTheme.darkFloatingBtn,
    textTheme: ATextTheme.darkTextTheme,
    elevatedButtonTheme: AElevatedBtnTheme.lightElevatedButton,
  );
}
