import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIpController extends GetxController {
  static SignIpController get find => Get.find();

  // text field controllers for sign ip screen
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // signup function called on button press
  void LoginUser(String Username, String password) {}
}
