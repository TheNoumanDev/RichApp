import 'package:fcsmadproject/constants/routes.dart';
import 'package:fcsmadproject/views/LoginView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         FirebaseAuth.instance.signOut();
      //         GoogleSignIn().signOut();
      //         Navigator.of(context).push(
      //             MaterialPageRoute(builder: (context) => const LoginView()));
      //       },
      //       icon: const Icon(Icons.logout),
      //     ),
      //   ],
      // ),
      body: SafeArea(
          child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(37, 24, 78, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Profile',
                  style: GoogleFonts.lobster(
                    textStyle: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  height: height * 0.8,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double innerHeight = constraints.maxHeight;
                      double innerWidth = constraints.maxWidth;
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          // Part of Stack to display other content.
                          Positioned(
                            bottom: 15,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: innerHeight * 0.9,
                              width: innerWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromRGBO(110, 47, 180, 1),
                              ),
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height * 0.07,
                                    ),
                                    // For displaying the names of the User which is currently Signed In.
                                    Text(
                                      FirebaseAuth
                                          .instance.currentUser!.displayName!,
                                      style: GoogleFonts.lobster(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.0001,
                                    ),

                                    // this container is used to display the point
                                    // and the wallet money.
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromRGBO(60, 24, 96, 1),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                right: 0,
                                                left: 00),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        'assets/images/icons8-coins-32.png',
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Points',
                                                  style: GoogleFonts.lobster(
                                                    textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '10',
                                                  style: GoogleFonts.lobster(
                                                    textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0,
                                                right: 0,
                                                top: 8,
                                                bottom: 8),
                                            child: Container(
                                              height: 50,
                                              width: 3,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      'assets/images/icons8-cash-32.png',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Money',
                                                style: GoogleFonts.lobster(
                                                  textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '1',
                                                style: GoogleFonts.lobster(
                                                  textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      height: innerHeight * 0.53,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromRGBO(60, 24, 96, 1),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            ReuseableRow(
                                                title: "Personal Details",
                                                image: AssetImage(
                                                    'assets/images/icons8-male-user-32.png')),
                                            ReuseableRow(
                                                title: "Privacy Policy",
                                                image: AssetImage(
                                                    'assets/images/icons8-user-shield-32.png')),
                                            ReuseableRow(
                                                title: "Rate Us",
                                                image: AssetImage(
                                                    'assets/images/icons8-star-32.png')),
                                            ReuseableRow(
                                                title: "Logout",
                                                image: AssetImage(
                                                    'assets/images/icons8-login-32.png')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // This is part of stack which is used to display
                          // the profile picture of the user.
                          Positioned(
                            top: 20,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300],
                                ),
                                child: Icon(
                                  Icons.person_2,
                                  size: 70,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );

//     Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () async {
//               await GoogleSignIn().signOut();
//               FirebaseAuth.instance.signOut();
//               Navigator.of(context)
//                   .pushNamedAndRemoveUntil(LoginViewRoute, (route) => false);
//             },
//           ),
//         ],
//       ),
//       body: const Center(
//         child: Text('you are login'),
//       ),
//     );
  }
}

class ReuseableRow extends StatelessWidget {
  String title;
  AssetImage image;
  ReuseableRow({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 11.0, right: 8, left: 8, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      title,
                      style: GoogleFonts.lobster(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
        // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        //Divider()
      ],
    );
  }
}
