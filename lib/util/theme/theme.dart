import 'package:a_chat/util/theme/widgets_themes/appbar_theme.dart';
import 'package:a_chat/util/theme/widgets_themes/elevated_button_theme.dart';
import 'package:a_chat/util/theme/widgets_themes/floating_action_button_theme.dart';
import 'package:a_chat/util/theme/widgets_themes/text_theme.dart';
import 'package:flutter/material.dart';

class ATheme {
  ATheme._(); // Void to creating instance of class

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: AAppBarTheme.lightAppBar,
    floatingActionButtonTheme: AFloatingActionButtonTheme.lightFloatingBtn,
    textTheme: ATextTheme.lightTextTheme,
    elevatedButtonTheme: AElevatedBtnTheme.lightElevatedButton,
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: AAppBarTheme.darkAppBar,
    floatingActionButtonTheme: AFloatingActionButtonTheme.darkFloatingBtn,
    textTheme: ATextTheme.darkTextTheme,
    elevatedButtonTheme: AElevatedBtnTheme.lightElevatedButton,
  );
}
