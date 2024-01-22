import 'package:a_chat/util/constants/image_strings.dart';
import 'package:a_chat/util/constants/sizes.dart';
import 'package:a_chat/util/constants/texts.dart';
import 'package:a_chat/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            AnimatedPositioned(
              top: AHelperFunctions.screenHeight() * .1,
              left: AHelperFunctions.screenWidth() * .25,
              width: AHelperFunctions.screenWidth() * .5,
              duration: const Duration(seconds: 2),
              child: Image.asset(AImages.googleLogo),
            ),
            Positioned(
              bottom: AHelperFunctions.screenHeight() * .2,
              left: AHelperFunctions.screenWidth() * .1,
              width: AHelperFunctions.screenWidth() * .8,
              height: AHelperFunctions.screenWidth() * .15,
              child: ElevatedButton.icon(
                onPressed: () {},
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
