import 'package:a_chat/util/constants/colors.dart';
import 'package:a_chat/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class AAppBar {
  AAppBar._();

  /// Light AppBar
  static const AppBarTheme lightAppBar = AppBarTheme(
    elevation: 5,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AColors.white, size: ASizes.iconMd),
    actionsIconTheme: IconThemeData(color: AColors.white, size: ASizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 19.0, color: AColors.white, fontWeight: FontWeight.w600),
  );

  /// Dark AppBar
  static const AppBarTheme darkAppBar = AppBarTheme(
    elevation: 5,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AColors.white, size: ASizes.iconMd),
    actionsIconTheme: IconThemeData(color: AColors.white, size: ASizes.iconMd),
    titleTextStyle: TextStyle(
        color: AColors.white, fontSize: 19, fontWeight: FontWeight.w600),
  );
}
