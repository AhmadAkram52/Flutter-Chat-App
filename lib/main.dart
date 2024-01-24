import 'package:a_chat/app.dart';
import 'package:a_chat/firebase_options.dart';
import 'package:a_chat/util/local%20storage/preferences_utility.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
      overlays: []);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp])
      .then((value) {
    _initializeFirebase();
    _initializeLocalStorage();
    runApp(const AChatApp());
  });
}

_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

_initializeLocalStorage() async {
  await ASharedPreferences.init();
}
