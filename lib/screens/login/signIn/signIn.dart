import 'package:flutter/material.dart';
import 'package:ui/screens/login/signIn/signInClipper.dart';
import 'package:ui/screens/login/utils/floatingTransButton.dart';

import './signInForm.dart';

class SignIn extends StatelessWidget {
  SignIn({this.animate, this.showingSignIn});
  final Function animate;
  final bool showingSignIn;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ClipPath(
      clipper: SignInClipper(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        height: height * 0.9,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
              child: Column(
                children: [
                  _header,
                  SizedBox(height: 40),
                  SignInForm(),
                ],
              ),
            ),
            Positioned(
              right: 2,
              bottom: 15,
              child: FloatingTransButton(
                  animate: animate, showingSignIn: showingSignIn),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _header = Center(
  child: Text(
    'Sign In',
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
    ),
  ),
);
