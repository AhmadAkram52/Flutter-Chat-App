import 'package:a_chat/common/widgets/bar/app_bar.dart';
import 'package:a_chat/common/widgets/elevated_button_with_Icon.dart';
import 'package:a_chat/util/apis/firebase_instances.dart';
import 'package:a_chat/util/constants/sizes.dart';
import 'package:a_chat/util/helpers/auth_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/profile_widgets/profile_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AAppBar(
        title: Text('Profile Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///Profile Image
                const ProfileImage(),
                const SizedBox(height: ASizes.spaceBtwItems),

                /// Email
                Text(
                  Apis.auth.currentUser!.email.toString(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: ASizes.spaceBtwSections),

                /// Name Field
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: ASizes.spaceBtwItems),

                /// About Field
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'About',
                    prefixIcon: Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: ASizes.spaceBtwSections * 1.5),

                /// Update Button
                AElevatedButtonWithIcon(
                  horizontalPadding: ASizes.spaceBtwSections * 2,
                  text: 'Update',
                  icon: const Icon(
                    Icons.login,
                    size: ASizes.iconXl,
                    color: Colors.white,
                  ),
                  onPress: () {},
                )
              ],
            ),
          ),
        ),
      ),

      /// LogOut Button
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
            right: ASizes.md, bottom: ASizes.defaultSpace),
        child: AElevatedButtonWithIcon(
          horizontalPadding: ASizes.spaceBtwItems,
          verticalPadding: 5,
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
            size: ASizes.iconXl,
          ),
          text: 'LogOut',
          bgColor: Colors.red,
          onPress: () {
            AuthHelper().signOut().then((value) => Get.offAllNamed('/login'));
          },
        ),
      ),
    );
  }
}
