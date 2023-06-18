import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_project/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:mad_project/src/repository/authentication_repository/authentication_repository.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(
    GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      // theme: ThemeData.light(useMaterial3: true).copyWith(
      //   scaffoldBackgroundColor: co.whiteColor,
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: co.whiteColor,
      //     foregroundColor: co.blackColorr,
      //     elevation: 0,
      //     centerTitle: true,
      //   ),
      // ),
      home: CircularProgressIndicator(),
    ),
  );
}
