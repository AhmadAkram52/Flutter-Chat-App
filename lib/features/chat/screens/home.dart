import 'package:a_chat/common/widgets/chat_user_card.dart';
import 'package:a_chat/util/constants/colors.dart';
import 'package:a_chat/util/constants/sizes.dart';
import 'package:a_chat/util/helpers/auth_helper_functions.dart';
import 'package:a_chat/util/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.home),
        title: const Text('A Chat'),
        backgroundColor: AColors.primary,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                AuthHelper()
                    .signOut()
                    .then((value) => Get.offAllNamed('/login'));
              },
              icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(ASizes.sm),
        child: Center(
          child: FutureBuilder(
            future: AuthHelper().getAdditionalUserDataFromLocalStorage(),
            builder: (context, sn) {
              if (sn.hasData) {
                Map<String, String?> userData = sn.data as Map<String, String?>;
                return Column(
                  children: [
                    AChatUserCard(
                      name: 'Ahmad Akram',
                      lastMsg: "I Love You!",
                      lastMsgTime: '11:13',
                      image: '${userData['profile']}',
                    ),
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Card(
                        child: FutureBuilder(
                          future: AHelperFunctions.loadImage(
                              imageUrl: '${userData['profile']}'),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else {
                              return Image.network('${userData['profile']}');
                            }
                          },
                        ),
                      ),
                    ),
                    Text('${userData['email']}'),
                    Text('${userData['name']}'),
                  ],
                );
              } else {
                return const Text("Ahmad");
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_comment_rounded),
      ),
    );
  }
}
