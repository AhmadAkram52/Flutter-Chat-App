import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Apis {
  /// Auth
  static FirebaseAuth auth = FirebaseAuth.instance;

  /// FireStore
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
}
