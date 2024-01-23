import 'dart:async';

import 'package:a_chat/features/authentication/controllers/splash/splash%20controller.dart';
import 'package:a_chat/util/constants/image_strings.dart';
import 'package:a_chat/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController ctrl = Get.put(SplashController());

  @override
  void initState() {
    Timer(const Duration(milliseconds: 100), () {
      ctrl.startAnimation();
    });
    Timer(const Duration(seconds: 3), () {
      ctrl.goToLogin();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            AnimatedPositioned(
              top: AHelperFunctions.screenHeight() * .2,
              left: ctrl.startAnimate.value
                  ? AHelperFunctions.screenWidth() * .1
                  : AHelperFunctions.screenWidth() * .25,
              width: ctrl.startAnimate.value
                  ? AHelperFunctions.screenWidth() * .8
                  : AHelperFunctions.screenWidth() * .5,
              duration: const Duration(seconds: 2),
              child: Image.asset(AImages.chatIcon),
            ),
            Positioned(
              bottom: AHelperFunctions.screenHeight() * .2,
              left: AHelperFunctions.screenWidth() * .1,
              child: Text(
                "Developed By Ahmad Akram!",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
