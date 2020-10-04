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

Widget scholarCopyright(double _overlap) {
  return Padding(
    padding: EdgeInsets.only(left: 10, bottom: _overlap),
    child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          "\u00a9 Scholar 2020",
          style: TextStyle(
              color: primaryTheme, fontSize: 15, fontWeight: FontWeight.bold),
        )),
  );
}

Widget descriptionField() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
    child: TextField(
      decoration: InputDecoration(
          labelText: 'Work Description',
          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
      keyboardType: TextInputType.multiline,
      maxLines: null,
    ),
  );
}
