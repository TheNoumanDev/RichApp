import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../features/authentication/screens/Welcome.dart';
import '../../features/authentication/screens/login_screen/login_screen.dart';
import '../../features/authentication/screens/splash_screen/splash_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  // signup function called on button press
  void createUserWithEmailAndPassword(String Username, String password) {
    try {
      _auth.createUserWithEmailAndPassword(email: Username, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const WelcomeS())
          : Get.to(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Weak Password',
          'The password provided is too weak.',
          duration: const Duration(seconds: 3),
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Email already in use',
          'The account already exists for that email.',
          duration: const Duration(seconds: 3),
        );
      } else if (e.code == 'invalid-email') {
        Get.snackbar(
          'Invalid Email',
          'Email you have entered is not valid',
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  // signup function called on button press
  void loginUserWithEmailAndPassword(String Username, String password) {
    try {
      _auth
          .createUserWithEmailAndPassword(email: Username, password: password)
          .then((value) => Get.offAll(() => const WelcomeS()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Weak Password',
          'The password provided is too weak.',
          duration: const Duration(seconds: 3),
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Email already in use',
          'The account already exists for that email.',
          duration: const Duration(seconds: 3),
        );
      } else if (e.code == 'invalid-email') {
        Get.snackbar(
          'Invalid Email',
          'Email you have entered is not valid',
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  // logout function called on button press
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(LoginScreen());
    } catch (e) {
      print(e);
    }
  }

  _setInitialScreen(User? callback) {
    if (callback == null) {
      Get.offAll(() => splashScreen());
    } else {
      Get.offAll(() => const WelcomeS());
    }
  }
}
