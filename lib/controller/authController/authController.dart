import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_app/view/home_screens/UserHome/home_page.dart';

class AuthModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      // User canceled the sign-in
      return null;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    Get.offAll(HomePage());
    UserCredential userCredential = await _auth.signInWithCredential(credential);
    return userCredential.user;

  }
  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['public_profile', 'email'],
      );

      if (result.status == LoginStatus.success) {
        final AccessToken? accessToken = result.accessToken;

        if (accessToken != null) {
          final OAuthCredential credential =
          FacebookAuthProvider.credential(accessToken.token);

          UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

          print("User signed in: ${userCredential.user}");

          // Navigate to home page
          Get.offAll(HomePage());
        }
      } else {
        print('Facebook login failed: ${result.status}');
        print('Message: ${result.message}');
      }
    } catch (e) {
      print('Error during Facebook sign in: $e');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
  }




