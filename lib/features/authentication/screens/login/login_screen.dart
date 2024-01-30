import 'package:a_chat/common/widgets/elevated_button_with_Icon.dart';
import 'package:a_chat/features/authentication/controllers/login/login_controller.dart';
import 'package:a_chat/util/constants/image_strings.dart';
import 'package:a_chat/util/constants/sizes.dart';
import 'package:a_chat/util/constants/texts.dart';
import 'package:a_chat/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginCtrl = Get.put(LoginController());

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      loginCtrl.statAnimation();
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
              right: loginCtrl.isAnimation.value
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
              child: AElevatedButtonWithIcon(
                text: ATexts.signInWithGoogle,
                icon: Image.asset(
                  AImages.googleLogo,
                  height: ASizes.iconXl * 1.3,
                ),
                onPress: () => loginCtrl.login(context),
              )),
        ],
      ),
    );
  }
}
