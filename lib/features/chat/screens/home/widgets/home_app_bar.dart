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
    return Obx(() {
      return AAppBar(
        leading: const Icon(CupertinoIcons.home),
        title: HomeController.homeCtrl.isSearching.value
            ? TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search Here.....',
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  suffixIcon: IconButton(
                      icon: const Icon(
                        CupertinoIcons.clear_circled,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        HomeController.homeCtrl.isSearching.value =
                            !HomeController.homeCtrl.isSearching.value;
                        HomeController.homeCtrl.searchList.clear();
                      }),
                ),
                onChanged: (input) =>
                    HomeController.homeCtrl.updateSearchList(input),
              )
            : const Text('A Chat'),
        action: [
          Visibility(
            visible: !HomeController.homeCtrl.isSearching.value,
            child: IconButton(
              onPressed: () => HomeController.homeCtrl.isSearching.value =
                  !HomeController.homeCtrl.isSearching.value,
              icon: const Icon(Icons.search),
            ),
          ),
          IconButton(
            onPressed: () {
              HomeController.homeCtrl.gotoProfile();
            },
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      );
    });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(ADeviceUtils.getAppBarHeight());
}
