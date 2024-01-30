import 'package:a_chat/util/constants/colors.dart';
import 'package:flutter/material.dart';

class ATextFieldTheme {
  /// Light TextFieldTheme
  static InputDecorationTheme lightTextFieldTheme = InputDecorationTheme(
    prefixIconColor: AColors.buttonPrimary,
    labelStyle: const TextStyle(color: Colors.black),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AColors.buttonPrimary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AColors.darkGrey),
    ),
  );

  /// Dark TextFieldTheme
  static InputDecorationTheme darkTextFieldTheme = InputDecorationTheme(
    prefixIconColor: AColors.buttonPrimary,
    labelStyle: const TextStyle(color: Colors.white),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AColors.buttonPrimary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AColors.darkGrey),
    ),
  );
}
