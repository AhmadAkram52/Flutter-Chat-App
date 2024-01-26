import 'package:a_chat/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AChatUserCard extends StatelessWidget {
  final String image;
  final String name;
  final String lastMsg;
  final String lastMsgTime;

  const AChatUserCard(
      {super.key,
      required this.image,
      required this.name,
      required this.lastMsg,
      required this.lastMsgTime});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: FutureBuilder(
          future: AHelperFunctions.loadImage(imageUrl: image),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const CircleAvatar(child: Icon(Iconsax.user));
            } else {
              return CircleAvatar(backgroundImage: NetworkImage(image));
            }
          },
        ),
        title: Text(name),
        subtitle: Text(lastMsg),
        trailing: Text(lastMsgTime),
      ),
    );
  }
}
