import 'package:flutter/material.dart';

class BgLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CustomPaint(
      size: Size(width, height),
      painter: _Paint(),
    );
  }
}

class _Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    final path = Path();
    path.lineTo(0, size.height * 0.3);
    path.lineTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.1);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);

    path.moveTo(size.width, size.height * 0.55);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.6, size.width - 50, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);

    path.moveTo(0, size.height * 0.84);
    path.lineTo(size.width * 0.55, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
