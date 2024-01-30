import 'dart:convert';

import 'package:a_chat/features/chat/models/chat_user_model.dart';
import 'package:a_chat/util/local%20storage/preferences_utility.dart';

class AChatUserPreferences {
  static const String _userKey = 'chat_user';

  // Save ChatUserModel to SharedPreferences
  static Future<void> saveChatUser(ChatUserModel user) async {
    final Map<String, dynamic> userMap = user.toJson();
    final String userString = jsonEncode(userMap);
    await ASharedPreferences.saveString(_userKey, userString);
  }

  // Get ChatUserModel from SharedPreferences
  static ChatUserModel getChatUser() {
    final String userString = ASharedPreferences.getString(_userKey);
    if (userString.isNotEmpty) {
      final Map<String, dynamic> userMap = jsonDecode(userString);
      return ChatUserModel.fromJson(userMap);
    } else {
      // Return a default user or handle the absence of user data as needed
      return ChatUserModel(
        id: '',
        name: '',
        email: '',
        about: '',
        image: '',
        createdAt: '',
        lastActive: '',
        isOnline: false,
        pushToken: '',
      );
    }
  }

  static Future<void> removeCurrentUser() async {
    await ASharedPreferences.remove(_userKey);
  }
}
