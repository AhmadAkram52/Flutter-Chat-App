import 'package:a_chat/features/chat/controllers/profile/profile_controller.dart';
import 'package:a_chat/util/constants/colors.dart';
import 'package:a_chat/util/constants/image_strings.dart';
import 'package:a_chat/util/constants/sizes.dart';
import 'package:a_chat/util/device/device_utility.dart';
import 'package:a_chat/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AImagePickerBottomSheet extends StatelessWidget {
  const AImagePickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = AHelperFunctions.isDarkMode(context);
    final ProfileController profileCtrl = Get.put(ProfileController());
    return BottomSheet(
      onClosing: () {},
      elevation: 2,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Pick Profile Image",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: ASizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /// Gallery Picker
                    ElevatedButton(
                      onPressed: () async {
                        await profileCtrl
                            .pickedImageFromGallery()
                            .then((value) => profileCtrl.isPicked.value = true)
                            .onError((error, stackTrace) =>
                                profileCtrl.isPicked.value = false);
                        Navigator.pop(context);
                        profileCtrl.isPicked.value = true;
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isDark ? AColors.dark : AColors.light,
                          shape: const CircleBorder(),
                          fixedSize: Size(
                              ADeviceUtils.getScreenWidth(context) * .3,
                              ADeviceUtils.getScreenHeight() * .15)),
                      child: Image.asset(
                        AImages.galleryIcon,
                        // fit: BoxFit.fill,
                      ),
                    ),

                    /// Camera Picker
                    ElevatedButton(
                      onPressed: () async {
                        await profileCtrl
                            .pickedImageFromCamera()
                            .then((value) => profileCtrl.isPicked.value = true)
                            .onError((error, stackTrace) =>
                                profileCtrl.isPicked.value = false);
                        Navigator.pop(context);
                        profileCtrl.isPicked.value = true;
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor:
                              isDark ? AColors.dark : AColors.light,
                          fixedSize: Size(
                              ADeviceUtils.getScreenWidth(context) * .3,
                              ADeviceUtils.getScreenHeight() * .15)),
                      child: Image.asset(
                        AImages.cameraIcon,
                        // fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
