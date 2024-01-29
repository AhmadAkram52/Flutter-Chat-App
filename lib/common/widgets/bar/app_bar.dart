import 'package:a_chat/util/constants/colors.dart';
import 'package:a_chat/util/device/device_utility.dart';
import 'package:flutter/material.dart';

class AAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? action;
  final bool showBack;

  const AAppBar({
    super.key,
    this.leading,
    this.title,
    this.action,
    this.showBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBack ? const BackButton() : leading,
      title: title,
      backgroundColor: AColors.primary,
      actions: action,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(ADeviceUtils.getAppBarHeight());
}
