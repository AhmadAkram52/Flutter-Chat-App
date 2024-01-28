import 'package:a_chat/features/chat/models/chat_user_model.dart';
import 'package:a_chat/util/constants/colors.dart';
import 'package:a_chat/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AChatUserCard extends StatelessWidget {
  final ChatUserModel user;

  const AChatUserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(user.createdAt));
    return InkWell(
      onTap: () {},
      child: Card(
        child: ListTile(
          leading: FutureBuilder(
            future: AHelperFunctions.loadImage(imageUrl: user.image),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const CircleAvatar(child: Icon(Iconsax.user));
              } else {
                return CircleAvatar(backgroundImage: NetworkImage(user.image));
              }
            },
          ),
          title: Text(AHelperFunctions.capitalize(user.name)),
          subtitle: Text(
            user.email,
            maxLines: 1,
          ),
          trailing: user.isOnline
              ? Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AColors.success),
                )
              : Text(AHelperFunctions.getFormatDateTime(dateTime, format: 'Hm'),
                  maxLines: 1),
        ),
      ),
    );
  }
}
