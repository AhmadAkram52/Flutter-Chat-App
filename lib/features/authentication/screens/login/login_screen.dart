import 'package:a_chat/features/authentication/controllers/login/login_controller.dart';
import 'package:a_chat/util/constants/image_strings.dart';
import 'package:a_chat/util/constants/sizes.dart';
import 'package:a_chat/util/constants/texts.dart';
import 'package:a_chat/util/helpers/auth_helper_functions.dart';
import 'package:a_chat/util/helpers/helper_functions.dart';
import 'package:a_chat/util/helpers/user_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      controller.statAnimation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          ATexts.welcomeTo,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Stack(
        children: [
          Obx(() {
            return AnimatedPositioned(
              top: AHelperFunctions.screenHeight() * .15,
              right: controller.isAnimation.value
                  ? AHelperFunctions.screenWidth() * .25
                  : -AHelperFunctions.screenWidth() * .5,
              width: AHelperFunctions.screenWidth() * .5,
              duration: const Duration(seconds: 2),
              child: Image.asset(AImages.chatIcon),
            );
          }),
          Positioned(
            bottom: AHelperFunctions.screenHeight() * .2,
            left: AHelperFunctions.screenWidth() * .1,
            width: AHelperFunctions.screenWidth() * .8,
            height: AHelperFunctions.screenWidth() * .15,
            child: ElevatedButton.icon(
              onPressed: () {
                AHelperFunctions.showProgressBar();
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
              },
              icon: Image.asset(
                AImages.googleLogo,
                height: ASizes.iconXl * 1.3,
              ),
              label: Text(
                ATexts.signInWithGoogle,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
