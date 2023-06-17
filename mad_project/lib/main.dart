import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:mad_project/src/features/authentication/screens/splash_screen/splash_screen.dart';

import 'firebase_options.dart';

void main() {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: splashScreen(),
    ),
  );
}
