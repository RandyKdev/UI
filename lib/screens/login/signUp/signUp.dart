import 'package:flutter/material.dart';

import './signUpForm.dart';

class SignUp extends StatelessWidget {
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
              padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 40),
                  SignUpForm(),
                ],
              ),
            ),
            Positioned(
              left: 2,
              top: 15,
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
    Path path = Path();
    path.moveTo(0.0, size.height);
    path.lineTo(0.0, 30);
    path.quadraticBezierTo(0, 0, 30, 17);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
