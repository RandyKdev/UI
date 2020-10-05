import 'package:flutter/material.dart';

class SignUpClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0.0, size.height);
    path.lineTo(0.0, 30);
    path.quadraticBezierTo(0, 0, 30, 17);
    path.quadraticBezierTo(
        size.width, size.height * 0.3, size.width, size.height * 0.3 + 50);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
