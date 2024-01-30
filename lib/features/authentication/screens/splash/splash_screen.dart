import 'dart:async';

import 'package:a_chat/features/authentication/controllers/splash/splash%20controller.dart';
import 'package:a_chat/util/constants/image_strings.dart';
import 'package:a_chat/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController splashCtrl = Get.put(SplashController());

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      splashCtrl.startAnimation();
    });
    Future.delayed(const Duration(seconds: 3), () {
      splashCtrl.navToNext();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            top: AHelperFunctions.screenHeight() * .2,
            left: splashCtrl.startAnimate.value
                ? AHelperFunctions.screenWidth() * .1
                : AHelperFunctions.screenWidth() * .25,
            width: splashCtrl.startAnimate.value
                ? AHelperFunctions.screenWidth() * .8
                : AHelperFunctions.screenWidth() * .5,
            duration: const Duration(seconds: 2),
            child: Image.asset(AImages.chatIcon),
          ),
          Positioned(
            bottom: AHelperFunctions.screenHeight() * .2,
            width: AHelperFunctions.screenWidth(),
            child: Text(
              "Developed By Ahmad Akram😍!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
