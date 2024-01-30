import 'package:a_chat/common/widgets/bar/app_bar.dart';
import 'package:a_chat/common/widgets/elevated_button_with_Icon.dart';
import 'package:a_chat/features/chat/controllers/profile/profile_controller.dart';
import 'package:a_chat/features/chat/models/chat_user_model.dart';
import 'package:a_chat/features/chat/screens/profile/widgets/profile_image.dart';
import 'package:a_chat/util/constants/sizes.dart';
import 'package:a_chat/util/constants/texts.dart';
import 'package:a_chat/util/helpers/user_helper_functions.dart';
import 'package:a_chat/util/local%20storage/chat_user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController logoutCtrl = Get.put(ProfileController());
  final ChatUserModel user = AChatUserPreferences.getChatUser();

  @override
  void initState() {
    logoutCtrl.nameController.text = user.name;
    logoutCtrl.aboutController.text = user.about;
    super.initState();
  }

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
              children: [
                ///Profile Image
                ProfileImage(user: user),
                const SizedBox(height: ASizes.spaceBtwItems),

                /// Email
                Text(AUserHelperFunctions.user.email.toString(),
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: ASizes.spaceBtwSections),

                /// Name Field
                TextFormField(
                  // initialValue: user.name,
                  controller: logoutCtrl.nameController,
                  decoration: const InputDecoration(
                    labelText: ATexts.name,
                    hintText: ATexts.nameHint,
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: ASizes.spaceBtwItems),

                /// About Field
                TextFormField(
                  // initialValue: user.about,
                  controller: logoutCtrl.aboutController,
                  maxLines: 5,
                  minLines: 1,
                  decoration: const InputDecoration(
                    labelText: ATexts.about,
                    hintText: ATexts.aboutHint,
                    prefixIcon: Icon(Icons.info_outline),
                  ),
                ),
                const SizedBox(height: ASizes.spaceBtwSections * 1.5),

                /// Update Button
                AElevatedButtonWithIcon(
                  horizontalPadding: ASizes.spaceBtwSections * 2,
                  text: ATexts.update.toUpperCase(),
                  icon: const Icon(
                    Icons.login,
                    size: ASizes.iconXl,
                    color: Colors.white,
                  ),
                  onPress: () =>
                      logoutCtrl.updateUserData(context: context, user: user),
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
          text: ATexts.logout,
          bgColor: Colors.red,
          onPress: () => logoutCtrl.logout(context),
        ),
      ),
    );
  }
}
