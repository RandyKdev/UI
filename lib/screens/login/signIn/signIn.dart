import 'package:flutter/material.dart';

import './signInForm.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ClipPath(
      clipper: _LinePath(),
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
              padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  SignInForm(),
                ],
              ),
            ),
            Positioned(
              right: 2,
              bottom: 15,
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LinePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0.0, size.height * 0.7);
    //
    path.quadraticBezierTo(
        0.0, size.height * 0.7, size.width - 30, size.height - 17);
    //
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
