import 'package:a_chat/common/widgets/bar/app_bar.dart';
import 'package:a_chat/common/widgets/elevated_button_with_Icon.dart';
import 'package:a_chat/util/apis/firebase_instances.dart';
import 'package:a_chat/util/constants/colors.dart';
import 'package:a_chat/util/constants/sizes.dart';
import 'package:a_chat/util/helpers/auth_helper_functions.dart';
import 'package:a_chat/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
                SizedBox(
                  height: AHelperFunctions.screenWidth() * .5,
                  width: AHelperFunctions.screenWidth() * .5,
                  child: Stack(
                    children: [
                      Positioned(
                        child: SizedBox(
                          width: AHelperFunctions.screenWidth() * .5,
                          // color: AColors.primary,
                          child: FutureBuilder(
                            future: AHelperFunctions.loadImage(
                                imageUrl:
                                    'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=600'),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return CircleAvatar(
                                    radius: AHelperFunctions.screenWidth() * .5,
                                    backgroundColor: AColors.buttonPrimary,
                                    child: Expanded(
                                      child: Icon(Iconsax.user,
                                          color: Colors.white,
                                          size: AHelperFunctions.screenWidth() *
                                              .4),
                                    ));
                              } else {
                                return CircleAvatar(
                                  radius: AHelperFunctions.screenWidth() * .5,
                                  backgroundImage: const NetworkImage(
                                      'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=600'),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        bottom: 5,
                        child: IconButton(
                          onPressed: () {},
                          color: Colors.black,
                          style: IconButton.styleFrom(
                              shadowColor: Colors.black,
                              elevation: 3,
                              backgroundColor: Colors.white),
                          icon: const Icon(Icons.edit),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: ASizes.spaceBtwItems),

                /// Email
                Text(
                  Apis.auth.currentUser!.email.toString(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: ASizes.spaceBtwSections),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: ASizes.spaceBtwItems),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'About',
                    prefixIcon: Icon(Icons.error),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
            right: ASizes.md, bottom: ASizes.defaultSpace),
        child: AElevatedButtonWithIcon(
          icon: const Icon(
            Icons.login_outlined,
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
