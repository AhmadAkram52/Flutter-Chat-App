import 'package:a_chat/features/chat/models/chat_user_model.dart';
import 'package:a_chat/util/constants/colors.dart';
import 'package:a_chat/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final ChatUserModel user;

  const ProfileImage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
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
                future: AHelperFunctions.loadImage(imageUrl: user.image
                    // 'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=600',
                    ),
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
                    return CircleAvatar(
                      radius: AHelperFunctions.screenWidth() * .5,
                      backgroundImage: NetworkImage(
                        user.image,
                        // 'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=600',
                      ),
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
    );
  }
}
