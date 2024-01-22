import 'dart:async';

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
  final LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    Timer(const Duration(milliseconds: 500), () {
      controller.statAnimation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                top: AHelperFunctions.screenHeight() * .1,
                right: controller.isAnimation.value
                    ? AHelperFunctions.screenWidth() * .25
                    : -AHelperFunctions.screenWidth() * .5,
                width: AHelperFunctions.screenWidth() * .5,
                duration: const Duration(seconds: 2),
                child: Image.asset(AImages.googleLogo),
              );
            }),
            Positioned(
              bottom: AHelperFunctions.screenHeight() * .2,
              left: AHelperFunctions.screenWidth() * .1,
              width: AHelperFunctions.screenWidth() * .8,
              height: AHelperFunctions.screenWidth() * .15,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.offAllNamed('/home');
                },
                icon: Image.asset(
                  AImages.googleLogo,
                  height: ASizes.iconXl,
                ),
                label: const Text(ATexts.signInWithGoogle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
