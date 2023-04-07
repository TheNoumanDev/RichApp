import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authservice {
  // Google Sign In
  static Future<bool> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    UserCredential cre =
        await FirebaseAuth.instance.signInWithCredential(credential);
    User? user = cre.user;

    if (user != null) {
      if (cre.additionalUserInfo!.isNewUser) {
        await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
          "email": user.email,
          "name": user.displayName,
          "photo": user.photoURL,
          "uid": user.uid
        });
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['public_profile', 'email'],
    );

    print(loginResult);
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
