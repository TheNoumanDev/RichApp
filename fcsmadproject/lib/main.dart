import 'package:fcsmadproject/views/LadingView.dart';
import 'package:fcsmadproject/views/ProfileView.dart';
import 'package:fcsmadproject/views/UserInfoView.dart';
//import 'package:fcsmadproject/views/ProfileView.dart';
import 'package:fcsmadproject/views/VerificationEmail.dart';
import 'package:fcsmadproject/views/registerView.dart';
import 'package:fcsmadproject/views/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants/routes.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        registerViewRoute: (context) => const RegisterView(),
        LoginViewRoute: (context) => const LoginView(),
        landingViewRoute: (context) => const LandingView(),
        VerificationViewRoute: (context) => const VerificationEmail(),
        profileView: (context) => const ProfileView(),
        userInfoView: (context) => const UserInfoView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("hello");
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            // final ButtonStyle style = ElevatedButton.styleFrom(
            //     textStyle: const TextStyle(fontSize: 20));
            final currentUser = FirebaseAuth.instance.currentUser;

            if (currentUser == null) {
              return const LandingView(); //LoginView();
            } else {
              if (currentUser.emailVerified) {
                return const ProfileView();
              } else {
                return const ProfileView(); //verifyEmailView();
              }
            }
          // Navigator.of(context).push(MaterialPageRoute(
          // builder: (context) => const verifyEmailView()));

          //}

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
