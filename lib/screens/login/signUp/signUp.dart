import 'package:flutter/material.dart';
import 'package:ui/screens/login/signUp/signUpClipper.dart';
import 'package:ui/screens/login/utils/floatingTransButton.dart';

import './signUpForm.dart';

class SignUp extends StatelessWidget {
  SignUp({this.animate, this.showingSignIn});
  final Function animate;
  final bool showingSignIn;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ClipPath(
      clipper: SignUpClipper(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        height: height * 0.9,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 120, left: 30, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header,
                  SizedBox(height: 40),
                  SignUpForm(),
                ],
              ),
            ),
            Positioned(
              left: 2,
              top: 15,
              child: FloatingTransButton(
                animate: animate,
                showingSignIn: showingSignIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _header = Text(
  'Sign Up',
  style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  ),
);
