import 'package:a_chat/common/widgets/chat_user_card.dart';
import 'package:a_chat/features/chat/models/chat_user_model.dart';
import 'package:a_chat/features/chat/screens/widgets/home_app_bar.dart';
import 'package:a_chat/features/chat/screens/widgets/home_floating_button.dart';
import 'package:a_chat/util/apis/firebase_instances.dart';
import 'package:a_chat/util/constants/sizes.dart';
import 'package:a_chat/util/helpers/auth_helper_functions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<ChatUserModel> userList = [];
    return Scaffold(
      appBar: const AHomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(ASizes.sm),
        child: Center(
          child: FutureBuilder(
            future: AuthHelper().getAdditionalUserDataFromLocalStorage(),
            builder: (context, sn) {
              if (sn.hasData) {
                return Column(
                  children: [
                    Expanded(
                      child: StreamBuilder(
                        stream: Apis.fireStore.collection('users').snapshots(),
                        builder: (context, sn) {
                          switch (sn.connectionState) {
                            case ConnectionState.waiting:
                            case ConnectionState.none:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            case ConnectionState.active:
                            case ConnectionState.done:
                              final data = sn.data!.docs;
                              userList = data
                                      .map((e) =>
                                          ChatUserModel.fromJson(e.data()))
                                      .toList() ??
                                  [];
                              if (userList.isNotEmpty) {
                                return ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: userList.length,
                                  itemBuilder: (context, i) {
                                    return AChatUserCard(
                                      user: userList[i],
                                    );
                                  },
                                );
                              } else {
                                return const Center(
                                    child: Text("No Connection Found"));
                              }
                          }
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return const Text("No Content");
              }
            },
          ),
        ),
      ),
      floatingActionButton: const HomeFloatingButton(),
    );
  }
}
