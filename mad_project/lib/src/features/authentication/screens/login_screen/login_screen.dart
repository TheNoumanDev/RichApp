import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/re-usable-widgets/resuable.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../controllers/sign_in_controller.dart';
import 'Signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignIpController());
    final _formKey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: backgroundColorGradient,
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 70.0,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        buildTextField(
                          "Email",
                          const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          "Enter your Email",
                          controller.emailController,
                        ),

                        const SizedBox(height: 20.0),
                        buildTextField(
                          "Password",
                          const Icon(Icons.lock, color: Colors.white),
                          "Enter your Password",
                          controller.passwordController,
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove_red_eye_rounded),
                              color: Colors.white),
                        ),
                        const SizedBox(height: 3.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildRememberMeCheckbox(),
                            _buildForgotPasswordBtn(),
                          ],
                        ),
                        buildButton("SIGN IN", () async {
                          //                  try {
                          //   final email = _email.text;
                          //   final password = _password.text;
                          //   await FirebaseAuth.instance
                          //       .signInWithEmailAndPassword(email: email, password: password);
                          //   Navigator.of(context)
                          //       .pushNamedAndRemoveUntil(landingViewRoute, (route) => false);
                          // } on FirebaseAuthException catch (e) {
                          //   // you can check the exception type by e.runtimeType
                          //   // and then to catch this specific exception you can use
                          //   // on keyword with type behind catch keyword and then
                          //   // use the e.code method to check the error code adn implement
                          //   // the code accordingly.
                          //   if (e.code == "user-not-found") {
                          //     ShowDialogGeneric(context, "User Not Found");
                          //   } else if (e.code == "wrong-password") {
                          //     ShowDialogGeneric(context, "Wrong Password");
                          //   } else {
                          //     ShowDialogGeneric(context, "Error: ${e.code}");
                          //   }
                          // } catch (e) {
                          //   ShowDialogGeneric(context, e.toString());
                          // }
                        }),
                        // _buildEmailTF(),
                        // const SizedBox(height: 30.0),
                        // _buildPasswordTF(),
                        // _buildForgotPasswordBtn(),
                        // _buildRememberMeCheckbox(),
                        // _buildLoginBtn(),
                        _buildSignInWithText(),
                        _buildSocialBtnRow(),
                        const SizedBox(height: 100.0),
                        _buildSignupBtn(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

// Functions to build the widgets
  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                // setState(() {
                //   _rememberMe = value!;
                // });
              },
            ),
          ),
          const Text(
            'Remember me',
            style: rLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      // alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        //padding: EdgeInsets.only(right: 0.0),
        child: const Text(
          'Forgot Password?',
          style: rLabelStyle,
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: const <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign In with',
          style: rLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 60.0,
              width: 60.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(
                    rFacebookLogo,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Authservice.signInWithGoogle().then((result) {
              //   if (result != null) {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //           builder: (context) => const ProfileView()),
              //     );
              //   }
              // });
            },
            child: Container(
              height: 60.0,
              width: 60.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(
                    rGoogleLogo,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => Get.to(() => SignUp_screen()),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account?  ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
