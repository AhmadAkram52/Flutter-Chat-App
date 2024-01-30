import 'package:a_chat/features/chat/models/chat_user_model.dart';
import 'package:a_chat/util/apis/firebase_instances.dart';
import 'package:a_chat/util/local%20storage/chat_user_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AUserHelperFunctions {
  /// Get Current User instance
  static User get user => Apis.auth.currentUser!;

  static Future<bool> userExist() async {
    final docRef = Apis.fireStore.collection('users').doc(user.uid);
    final bool userExist = (await docRef.get()).exists;
    if (userExist) {
      await docRef.get().then((value) {
        final chatUser = ChatUserModel.fromJson(value.data()!);
        AChatUserPreferences.saveChatUser(chatUser);
      });
      return userExist;
    } else {
      return userExist;
    }
  }

  static Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final chatUser = ChatUserModel(
        id: user.uid,
        name: user.displayName.toString(),
        email: user.email.toString(),
        about: "Hi, I'm Using A Chat!",
        image: user.photoURL.toString(),
        createdAt: time,
        lastActive: time,
        isOnline: false,
        pushToken: '');
    AChatUserPreferences.saveChatUser(chatUser);
    return await Apis.fireStore
        .collection('users')
        .doc(user.uid)
        .set(chatUser.toJson());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getUsers() {
    return Apis.fireStore
        .collection('users')
        .where(
          'id',
          isNotEqualTo: user.uid,
        )
        .snapshots();
  }
}
