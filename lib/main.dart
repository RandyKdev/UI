import 'package:flutter/material.dart';
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
      color: Colors.red,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              padding: EdgeInsets.all(10.0),
            ),
          ),
        ],
      ),
    ));
  }
}
