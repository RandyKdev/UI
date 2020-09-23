import 'package:flutter/material.dart';
import 'dart:math';

import 'screenSizeGetters.dart';

void main() => MyApp();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          Container(
            color: Colors.blueAccent,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Positioned(
                    left: 10,
                    top: 20,
                    right: 10,
                    child: ClipPath(
                      clipper: LinePathClass(),
                      child: Container(
                        color: Colors.orange,
                        height: height * 0.8,
                      ),
                    ),
                  ),
                  Positioned(
                      left: 10,
                      top: (height * 0.8) + 20,
                      child: ClipPath(
                          clipper: LinePath(),
                          child: Container(
                            color: Colors.black,
                            height: height * 0.8,
                          )))
                ],
              ),
            ),
          ),
          Positioned(
            child: Transform.rotate(
              angle: (3 * pi) / 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(child: Icon(Icons.backspace)),
                  CircleAvatar(child: Icon(Icons.home)),
                  CircleAvatar(child: Icon(Icons.info)),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class LinePathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0.0, size.height * 0.75);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class LinePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
