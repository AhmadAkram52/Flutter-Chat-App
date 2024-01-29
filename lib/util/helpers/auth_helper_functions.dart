import 'package:a_chat/util/apis/firebase_instances.dart';
import 'package:a_chat/util/constants/colors.dart';
import 'package:a_chat/util/helpers/helper_functions.dart';
import 'package:a_chat/util/local%20storage/preferences_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  final FirebaseAuth _auth = Apis.auth;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  static const String _userKey = 'user';

  // Google Sign-In
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount == null) return null;

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      // Save user credentials in local storage using shared preferences
      saveUserInLocalStorage(user);

      // Fetch additional user details and save them in local storage
      if (user != null) {
        await _fetchAdditionalUserData(user);
      }

      return user;
    } catch (e) {
      AHelperFunctions.showSnackBar(
          msg: 'Error: Check Internet Connection', bgColor: AColors.error);
      return null;
    }
  }

  // Fetch additional user data (name, profile, email) from Google
  Future<void> _fetchAdditionalUserData(User user) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signInSilently();

      if (googleSignInAccount != null) {
        final GoogleSignInAccount? currentUser =
            await _googleSignIn.signInSilently();
        user.updateDisplayName(currentUser?.displayName);
        user.updatePhotoURL(currentUser!.photoUrl);
        user.updateEmail(currentUser.email);

        // Save additional user details in local storage using shared preferences
        saveAdditionalUserDataInLocalStorage(
            user.displayName ?? '', user.photoURL ?? '', user.email ?? '');
      }
    } catch (e) {
      AHelperFunctions.showSnackBar(
          msg: 'Error fetching additional user data: $e');
    }
  }

  bool isUserLogin() {
    if (_auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  // Save additional user data in local storage using shared preferences
  void saveAdditionalUserDataInLocalStorage(
      String name, String profile, String email) async {
    await ASharedPreferences.saveString('name', name);
    await ASharedPreferences.saveString('profile', profile);
    await ASharedPreferences.saveString('email', email);
  }

  // Retrieve additional user data from local storage
  Future<Map<String, String?>> getAdditionalUserDataFromLocalStorage() async {
    final String name = ASharedPreferences.getString('name');
    final String profile = ASharedPreferences.getString('profile');
    final String email = ASharedPreferences.getString('email');

    return {
      'name': name,
      'profile': profile,
      'email': email,
    };
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      // Remove user credentials and additional data from local storage
      clearUserFromLocalStorage();
    } catch (e) {
      AHelperFunctions.showSnackBar(msg: 'Error during sign-out: $e');
    }
  }

  // Save user in local storage using shared preferences
  void saveUserInLocalStorage(User? user) async {
    if (user == null) return;

    await ASharedPreferences.saveString(_userKey, user.uid);
  }

  // Retrieve user from local storage
  Future<String?> getUserFromLocalStorage() async {
    return ASharedPreferences.getString(_userKey);
  }

  // Clear user and additional data from local storage
  Future<void> clearUserFromLocalStorage() async {
    await ASharedPreferences.remove(_userKey);
    await ASharedPreferences.remove('name');
    await ASharedPreferences.remove('profile');
    await ASharedPreferences.remove('email');
  }
}
