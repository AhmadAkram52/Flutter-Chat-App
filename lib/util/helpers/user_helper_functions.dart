import 'package:a_chat/features/chat/models/chat_user_model.dart';
import 'package:a_chat/util/apis/firebase_instances.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AUserHelperFunctions {
  /// Get Current User instance
  static User get user => Apis.auth.currentUser!;

  static Future<bool> userExist() async {
    return (await Apis.fireStore.collection('users').doc(user.uid).get())
        .exists;
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
    return await Apis.fireStore
        .collection('users')
        .doc(user.uid)
        .set(chatUser.toJson());
  }
}
