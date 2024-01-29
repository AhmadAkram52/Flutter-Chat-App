import 'package:a_chat/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class AElevatedButtonWithIcon extends StatelessWidget {
  final Widget icon;
  final String text;
  final Color? bgColor;
  final VoidCallback onPress;

  const AElevatedButtonWithIcon({
    super.key,
    required this.text,
    this.bgColor,
    required this.icon,
    required this.onPress,
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
        padding: const EdgeInsets.symmetric(
            vertical: ASizes.md / 1.5, horizontal: ASizes.defaultSpace / 2),
      ),
    );
  }
}
