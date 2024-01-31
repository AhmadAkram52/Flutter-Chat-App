import 'package:a_chat/features/chat/models/chat_user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get homeCtrl => Get.find();

  List<ChatUserModel> userList = [];
  RxList searchList = [].obs;

  final TextEditingController searchController = TextEditingController();

  RxBool isSearching = false.obs;

  void updateSearchList(String input) {
    HomeController.homeCtrl.searchList.clear();
    for (var i in HomeController.homeCtrl.userList) {
      if ((i.name.toLowerCase().contains(input.toLowerCase())) ||
          (i.email.toLowerCase().contains(input.toLowerCase()))) {
        HomeController.homeCtrl.searchList.add(i);
      }
    }
  }

  void gotoProfile() {
    Get.toNamed('/profile');
  }
}
