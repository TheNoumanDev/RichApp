import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_project/src/features/authentication/screens/login_screen/Signup_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get find => Get.find();

  // text field controllers for sign up screen
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  // signup function called on button press
  void registerUser(String Username, String password) {}
}
