import 'package:a_chat/util/constants/image_strings.dart';
import 'package:a_chat/util/constants/sizes.dart';
import 'package:a_chat/util/device/device_utility.dart';
import 'package:flutter/material.dart';

class AImagePickerBottomSheet extends StatelessWidget {
  const AImagePickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  width: ADeviceUtils.getScreenWidth(context) * .2,
                  height: ADeviceUtils.getScreenWidth(context) * .2,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    AImages.galleryIcon,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: ADeviceUtils.getScreenWidth(context) * .2,
                  height: ADeviceUtils.getScreenWidth(context) * .2,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    AImages.cameraIcon,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
