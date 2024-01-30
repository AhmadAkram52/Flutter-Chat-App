import 'package:a_chat/util/apis/firebase_instances.dart';
import 'package:a_chat/util/helpers/user_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  Rx<String> about = ''.obs;

  Future<String> getUserAbout() async {
    final doc = await Apis.fireStore
        .collection('users')
        .doc(AUserHelperFunctions.user.uid)
        .get();

    final data = doc.data() as Map<String, dynamic>;
    about.value = data['about'];
    return about.value;
  }
}
