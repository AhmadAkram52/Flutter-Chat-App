import 'package:a_chat/features/chat/controllers/profile/profile_controller.dart';
import 'package:a_chat/features/chat/models/chat_user_model.dart';
import 'package:a_chat/features/chat/screens/profile/widgets/profile_image_picker_bottom_sheet.dart';
import 'package:a_chat/util/constants/colors.dart';
import 'package:a_chat/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImage extends StatelessWidget {
  final ChatUserModel user;

  const ProfileImage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final ProfileController profileCtrl = Get.put(ProfileController());
    return SizedBox(
      height: AHelperFunctions.screenWidth() * .5,
      width: AHelperFunctions.screenWidth() * .5,
      child: Stack(
        children: [
          Positioned(
            child: SizedBox(
              width: AHelperFunctions.screenWidth() * .5,
              // color: AColors.primary,
              child: FutureBuilder(
                future: AHelperFunctions.loadImage(imageUrl: user.image),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return CircleAvatar(
                        radius: AHelperFunctions.screenWidth() * .5,
                        backgroundColor: AColors.buttonPrimary,
                        child: Expanded(
                          child: Icon(Icons.person,
                              color: Colors.white,
                              size: AHelperFunctions.screenWidth() * .4),
                        ));
                  } else {
                    return Obx(() {
                      return CircleAvatar(
                        radius: AHelperFunctions.screenWidth() * .5,
                        backgroundImage: profileCtrl.isPicked.value
                            ? FileImage(profileCtrl.img) as ImageProvider
                            : NetworkImage(
                                user.image,
                              ),
                      );
                    });
                  }
                },
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 5,
            child: IconButton(
              onPressed: () => Get.bottomSheet(const AImagePickerBottomSheet()),
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
    );
  }
}
