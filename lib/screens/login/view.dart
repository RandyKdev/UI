import 'package:flutter/material.dart';
import 'package:ui/screens/login/signInButtons.dart';

import '../../colorConstants.dart';
import './bgLogin.dart';
import 'signIn/signIn.dart';
import 'signUp/signUp.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          BgLogin(),
          Positioned(
            left: 20,
            top: 30,
            right: 20,
            child: SignIn(),
          ),
          Positioned(
            left: 20,
            top: height * 0.9,
            right: 20,
            child: SignUp(),
          ),
          Positioned(
            top: height * 0.8,
            child: SignInButtons(),
          ),
        ],
      ),
    );
  }
}
