import 'package:flutter/material.dart';

class AElevatedButtonWithIcon extends StatelessWidget {
  final Widget icon;
  final String text;
  final Color? bgColor;
  final VoidCallback onPress;
  final double horizontalPadding;
  final double verticalPadding;

  const AElevatedButtonWithIcon({
    super.key,
    required this.text,
    this.bgColor,
    required this.icon,
    required this.onPress,
    this.horizontalPadding = 10,
    this.verticalPadding = 10,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPress,
      icon: icon,
      label: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .apply(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 20,
        backgroundColor: bgColor,
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding, horizontal: horizontalPadding),
      ),
    );
  }
}
