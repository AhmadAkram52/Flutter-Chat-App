import 'package:a_chat/common/widgets/bar/app_bar.dart';
import 'package:a_chat/features/chat/controllers/home/home_controller.dart';
import 'package:a_chat/util/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeCtrl = Get.put(HomeController());
    return AAppBar(
      leading: const Icon(CupertinoIcons.home),
      title: const Text('A Chat'),
      action: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(
            onPressed: () {
              homeCtrl.gotoProfile();
            },
            icon: const Icon(Icons.more_vert_outlined)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(ADeviceUtils.getAppBarHeight());
}
