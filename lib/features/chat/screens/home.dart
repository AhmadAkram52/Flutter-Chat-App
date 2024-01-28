import 'package:a_chat/common/widgets/chat_user_card.dart';
import 'package:a_chat/util/apis/firebase_instances.dart';
import 'package:a_chat/util/constants/colors.dart';
import 'package:a_chat/util/constants/sizes.dart';
import 'package:a_chat/util/helpers/auth_helper_functions.dart';
import 'package:basic_utils/basic_utils.dart';
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
                    Expanded(
                      child: StreamBuilder(
                        stream: Apis.fireStore.collection('users').snapshots(),
                        builder: (context, sn) {
                          final data = sn.data!.docs;

                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, i) {
                              final String name = StringUtils.capitalize(
                                  data[i].data()['name'].toString(),
                                  allWords: true);
                              return AChatUserCard(
                                name: name,
                                lastMsg: "I Love You!",
                                lastMsgTime: '11:13',
                                image: '${userData['profile']}',
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return const Text("Ahmad");
              }
            },
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
            right: ASizes.md, bottom: ASizes.defaultSpace),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add_comment_rounded),
        ),
      ),
    );
  }
}
