import 'package:a_chat/common/widgets/bar/app_bar.dart';
import 'package:a_chat/util/device/device_utility.dart';
import 'package:a_chat/util/helpers/auth_helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AAppBar(
      leading: const Icon(CupertinoIcons.home),
      title: const Text('A Chat'),
      action: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(
            onPressed: () {
              AuthHelper().signOut().then((value) => Get.offAllNamed('/login'));
            },
            icon: const Icon(Icons.more_vert)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(ADeviceUtils.getAppBarHeight());
}
