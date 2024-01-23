import 'package:a_chat/util/constants/colors.dart';
import 'package:a_chat/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class AElevatedBtnTheme {
  /// Light ElevatedButton
  static final ElevatedButtonThemeData lightElevatedButton =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ASizes.md),
      ),
      textStyle:
          const TextStyle(fontSize: ASizes.fontSizeLg, color: AColors.white),
      backgroundColor: AColors.buttonPrimary,
    ),
  );

  /// Dark ElevatedButton
  static final ElevatedButtonThemeData darkElevatedButton =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ASizes.md),
      ),
      textStyle:
          const TextStyle(fontSize: ASizes.fontSizeLg, color: AColors.white),
      backgroundColor: AColors.buttonPrimary,
    ),
  );
}
