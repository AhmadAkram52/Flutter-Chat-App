import 'package:a_chat/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class AFloatingActionButton extends StatelessWidget {
  final Widget child;
  final Color? bgColor;
  final VoidCallback onPress;

  const AFloatingActionButton({
    super.key,
    required this.child,
    this.bgColor,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: ASizes.md, bottom: ASizes.defaultSpace),
      child: FloatingActionButton(
        elevation: 20,
        onPressed: onPress,
        backgroundColor: bgColor,
        child: child,
      ),
    );
  }
}
