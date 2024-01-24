import 'package:a_chat/util/constants/colors.dart';
import 'package:a_chat/util/helpers/auth_helper_functions.dart';
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
      body: Center(
        child: FutureBuilder(
          future: AuthHelper().getAdditionalUserDataFromLocalStorage(),
          builder: (context, sn) {
            if (sn.hasData) {
              Map<String, String?> userData = sn.data as Map<String, String?>;
              return Column(
                children: [
                  Image.network(
                    '${userData['profile']}',
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_comment_rounded),
      ),
    );
  }
}
