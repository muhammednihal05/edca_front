import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static Future<bool> checkAuthStatus() async {
    try {
      return FirebaseAuth.instance.currentUser != null;
    } catch (e) {
      throw Exception("unable to get Auth statues");
    }
  }
}
