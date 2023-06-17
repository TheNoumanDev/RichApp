import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/re-usable-widgets/resuable.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../controllers/sign_up_controller.dart';
import 'login_screen.dart';

class SignUp_screen extends StatelessWidget {
  SignUp_screen({super.key});

  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
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
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        buildTextField(
                            "Full Name",
                            const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            "Enter your Full Name",
                            controller.nameController),
                        const SizedBox(height: 10.0),
                        buildTextField(
                            "Email",
                            const Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            "Enter your Email",
                            controller.emailController),
                        const SizedBox(height: 10.0),
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
                        const SizedBox(height: 10.0),
                        buildTextField(
                          "Confirm Password",
                          const Icon(Icons.lock, color: Colors.white),
                          "Confirm your Password",
                          controller.confirmPasswordController,
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove_red_eye_rounded),
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10.0),
                        buildTextField(
                          "Phone Number",
                          const Icon(Icons.lock, color: Colors.white),
                          "Phone Number with Code",
                          controller.phoneController,
                        ),
                        _buildSignUpBtn(),
                        _buildSignUpnWithText(),
                        _buildSocialBtnRow(),
                        _buildSigninBtn(),
                        // _buildEmailTF(),
                        // const SizedBox(
                        //   height: 20.0,
                        // ),
                        // _buildPasswordTF(),
                        // const SizedBox(
                        //   height: 10.0,
                        // ),
                        // _buildConfirmPasswordTF(),
                        // //_buildForgotPasswordBtn(),
                        // //  _buildRememberMeCheckbox(),
                        // _buildSignUpBtn(),
                        // _buildSignInWithText(),
                        // _buildSocialBtnRow(),
                        // _buildSignupBtn(),
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

  Widget _buildSignUpBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 5.0,
        ),
        onPressed: () async {
          // try {
          //   final email = _email.text;
          //   final password = _password.text;
          //   final confirmPass = _confirmPassword.text;
          //   if (password != confirmPass) {
          //     ShowDialogGeneric(context, "Passwords do not match.");
          //     return;
          //   }
          //   final userCredential = await FirebaseAuth.instance
          //       .createUserWithEmailAndPassword(
          //           email: email, password: password);
          //   FirebaseFirestore.instance
          //       .collection("users")
          //       .doc(userCredential.user!.uid)
          //       .set({
          //     "email": userCredential.user!.email,
          //     "name": '',
          //     "photo": '',
          //     "uid": userCredential.user!.uid
          //   });
          //   Navigator.of(context)
          //       .pushNamedAndRemoveUntil(userInfoView, (route) => false);
          // } on FirebaseAuthException catch (e) {
          //   if (e.code == "weak-password") {
          //     ShowDialogGeneric(context, "The password provided is too weak.");
          //   } else if (e.code == "email-already-in-use") {
          //     ShowDialogGeneric(
          //         context, "The account already exists for that email.");
          //   } else if (e.code == "invalid-email") {
          //     ShowDialogGeneric(context, "The email is invalid.");
          //   } else {
          //     ShowDialogGeneric(context, "Something went wrong.");
          //   }
          // } catch (e) {
          //   ShowDialogGeneric(context, "Error: ${e.toString()}");
          //   devtools.log(e.toString());
          // }
        },
        child: const Text(
          'SIGN UP',
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

  Widget _buildSignUpnWithText() {
    return const Text(
      '- OR -',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              // Authservice.signInWithFacebook().then((result) {
              //   Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => const ProfileView()),
              //   );
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
              //   Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => const ProfileView()),
              //   );
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

  Widget _buildSigninBtn() {
    return GestureDetector(
      onTap: () => Get.to(() => LoginScreen()),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Already have an Account?  ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign In',
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
