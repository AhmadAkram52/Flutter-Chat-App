import 'package:a_chat/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class AFloatingActionButton extends StatelessWidget {
  final Widget child;
  final Color? bgColor;

  const AFloatingActionButton({
    super.key,
    required this.child,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: ASizes.md, bottom: ASizes.defaultSpace),
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: bgColor,
        child: child,
      ),
    );
  }
}
