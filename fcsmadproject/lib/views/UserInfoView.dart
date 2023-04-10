import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../constants/routes.dart';
import '../utilities/helpingFuntions.dart';

class UserInfoView extends StatefulWidget {
  const UserInfoView({super.key});

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  late final TextEditingController _Name;
  late final TextEditingController _code;
  late final TextEditingController _Number;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Name = TextEditingController();
    _code = TextEditingController();
    _Number = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _code.text = '+92';

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(37, 24, 78, 0.4),
                Color.fromRGBO(37, 24, 78, 0.7),
                Color.fromRGBO(37, 24, 78, 0.8),
                Color.fromRGBO(37, 24, 78, 1),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Column(children: [
              const SizedBox(height: 50.0),
              const Text(
                'Information',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),
              const Text(
                'Please fill in the details to continue',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),
              _buildFullNameTF(),

              const SizedBox(height: 30.0),
              _buildPhoneTF(),
              _buildSignUpBtn(),

              // Padding(
              //   padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              //   child: _buildPhoneTF(),
              // ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Phone Number',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: IntlPhoneField(
              controller: _Number,
              textAlignVertical: TextAlignVertical.bottom,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              initialCountryCode: 'PK',
              dropdownTextStyle: const TextStyle(
                color: Colors.white,
              ),
              invalidNumberMessage: '',
              validator: (p0) {
                if (p0 == null) {
                  return 'Please enter a valid number';
                }
                return 'COrrect';
              },
              onSaved: (p0) {},
              onChanged: (p0) {},
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 5.0,
        ),
        onPressed: () {
          FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set({
            "name": _Name.text,
            "Number": _Number.text,
          });
          Navigator.of(context)
              .pushNamedAndRemoveUntil(profileView, (route) => false);
        },
        child: const Text(
          'CONTINUE',
          style: TextStyle(
            color: Color.fromRGBO(37, 24, 78, 1),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildFullNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Full Name',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _Name,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              //contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),

              hintText: 'Enter your name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

//   Widget _buildPhoneTF() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         const Text(
//           'Phone Number',
//           style: kLabelStyle,
//         ),
//         const SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: Row(
//             children: [
//               SizedBox(
//                 width: 50,
//                 child: TextField(
//                   controller: _code,
//                   keyboardType: TextInputType.number,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontFamily: 'OpenSans',
//                   ),
//                   decoration: const InputDecoration(
//                       border: InputBorder.none,
//                       hintStyle: kHintTextStyle,
//                       contentPadding: EdgeInsets.only(left: 10)),
//                 ),
//               ),
//               const Text('|',
//                   style: TextStyle(color: Colors.grey, fontSize: 20)),
//               SizedBox(
//                 width: 300,
//                 child: TextField(
//                   controller: _Number,
//                   keyboardType: TextInputType.emailAddress,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontFamily: 'OpenSans',
//                   ),
//                   decoration: const InputDecoration(
//                     border: InputBorder.none,
//                     //contentPadding: EdgeInsets.only(top: 14.0),
//                     // prefixIcon: Icon(
//                     //   Icons.email,
//                     //   color: Colors.white,
//                     // ),

//                     hintText: 'Phone Number',
//                     hintStyle: kHintTextStyle,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
}
