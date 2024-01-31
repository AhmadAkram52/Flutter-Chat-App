import 'package:a_chat/common/widgets/chat_user_card.dart';
import 'package:a_chat/common/widgets/floating_action_button.dart';
import 'package:a_chat/features/chat/controllers/home/home_controller.dart';
import 'package:a_chat/features/chat/models/chat_user_model.dart';
import 'package:a_chat/features/chat/screens/home/widgets/home_app_bar.dart';
import 'package:a_chat/util/constants/sizes.dart';
import 'package:a_chat/util/helpers/user_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeCtrl = Get.put(HomeController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AHomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(ASizes.sm),
        child: StreamBuilder(
          stream: AUserHelperFunctions.getUsers(),
          builder: (context, sn) {
            switch (sn.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                final data = sn.data!.docs;
                homeCtrl.userList = data
                        .map((e) => ChatUserModel.fromJson(e.data()))
                        .toList() ??
                    [];
                if (homeCtrl.userList.isNotEmpty) {
                  return Obx(() {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: homeCtrl.isSearching.value
                          ? homeCtrl.searchList.length
                          : homeCtrl.userList.length,
                      itemBuilder: (context, i) {
                        return AChatUserCard(
                          user: homeCtrl.isSearching.value
                              ? homeCtrl.searchList[i]
                              : homeCtrl.userList[i],
                        );
                      },
                    );
                  });
                } else {
                  return const Center(child: Text("No Connection Found"));
                }
            }
          },
        ),
      ),
      floatingActionButton: AFloatingActionButton(
        onPress: () {},
        child: const Icon(Icons.add_comment_rounded),
      ),
    );
  }
}
