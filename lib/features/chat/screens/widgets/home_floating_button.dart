import 'package:a_chat/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeFloatingButton extends StatelessWidget {
  const HomeFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: ASizes.md, bottom: ASizes.defaultSpace),
      child: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_comment_rounded),
      ),
    );
  }
}
