import 'package:a_chat/util/helpers/auth_helper_functions.dart';
import 'package:a_chat/util/helpers/helper_functions.dart';
import 'package:a_chat/util/helpers/user_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isAnimation = false.obs;

  statAnimation() {
    isAnimation.value = true;
  }

  void login(BuildContext context) {
    {
      AHelperFunctions.showProgressBar(context);
      AuthHelper().signInWithGoogle().then((user) async {
        Navigator.pop(context);
        if (user != null) {
          if (await AUserHelperFunctions.userExist()) {
            AHelperFunctions.showSnackBar(msg: 'SignIn Success');
            Get.offAllNamed('/home');
          } else {
            await AUserHelperFunctions.createUser().then((value) {
              AHelperFunctions.showSnackBar(msg: 'SignIn Success');
              Get.offAllNamed('/home');
            });
          }
        }
      });
    }
  }
}
