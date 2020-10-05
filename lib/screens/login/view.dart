import 'package:flutter/material.dart';
import 'package:ui/screens/login/utils/socialSignInButtons.dart';

import 'utils/bgLogin.dart';
import 'signIn/signIn.dart';
import 'signUp/signUp.dart';
import 'formProps.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showingSignIn = true;
  void animate() {
    setState(() {
        showingSignIn = !showingSignIn;
      });
    emailController.clear();
    passwordController.clear();
    usernameController.clear();
  }
  Duration duration = Duration(milliseconds: 1500);
 
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BgLogin(),
          AnimatedPositioned(
            duration: duration,
            left: 20,
            top: showingSignIn ? 30 : -(height * 0.9) + 60,
            right: 20,
            child: SignIn(
              animate: animate,
              showingSignIn: showingSignIn,
            ),
          ),
          AnimatedPositioned(
            duration: duration,
            left: 20,
            top: showingSignIn ? height * 0.9 : 60,
            right: 20,
            child: SignUp(
              animate: animate,
              showingSignIn: showingSignIn,
            ),
          ),
          AnimatedPositioned(
            duration: duration,
            top: showingSignIn ? height * 0.8 : 60,
            left: showingSignIn ? 0 : width * 0.18,
            child: SocialSignInButtons(showingSignIn),
          ),
        ],
      ),
    );
  }
}
