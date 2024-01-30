import 'package:a_chat/features/chat/models/chat_user_model.dart';
import 'package:a_chat/util/apis/firebase_instances.dart';
import 'package:a_chat/util/helpers/auth_helper_functions.dart';
import 'package:a_chat/util/helpers/helper_functions.dart';
import 'package:a_chat/util/local%20storage/chat_user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  /// Logout Function
  void logout(BuildContext context) {
    AHelperFunctions.showProgressBar(context);
    AChatUserPreferences.removeCurrentUser();
    AuthHelper().signOut().then((value) {
      Navigator.pop(context);
      Get.offAllNamed('/login');
    });
  }

  /// Update User Function
  Future<void> updateUserData(
      {required BuildContext context, required ChatUserModel user}) async {
    AHelperFunctions.showProgressBar(context);
    final String updatedName = nameController.text.toString();
    final String updatedAbout = aboutController.text.toString();
    final updatedUserData = {'name': updatedName, 'about': updatedAbout};
    await Apis.fireStore
        .collection('users')
        .doc(user.id)
        .update(updatedUserData)
        .then((value) async {
      Apis.fireStore.collection('users').doc(user.id).get().then((user) {
        final updatedUser = ChatUserModel.fromJson(user.data()!);
        AChatUserPreferences.saveChatUser(updatedUser);
        Navigator.pop(context);
      });
    });
  }
}
