import 'package:flutter/material.dart';

import '../../colorConstants.dart';

Widget appBar(String text) {
  return AppBar(
    bottomOpacity: 5.7,
    elevation: 10,
    title: Text(
      text,
      style: TextStyle(color: Colors.white),
    ),
  );
}

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    paint.color = secondaryTheme;
    path.lineTo(0.0, 250);
    path.quadraticBezierTo(251, 251, 250, 0.0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
