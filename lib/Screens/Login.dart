//flutter packages
import 'package:flutter/material.dart';
//import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

//files
import 'package:ui/colorConstants.dart';
import 'package:ui/screenSizeGetters.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _form(),
              _spacing(90),
              Center(
                child: Text("Or sign in with"),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: _bottomScreen(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomScreen() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SignInButton(
          Buttons.Facebook,
          onPressed: () {},
          mini: true,
        ),
        SignInButton(
          Buttons.Apple,
          onPressed: () {},
          mini: true,
        ),
        SignInButton(
          Buttons.Twitter,
          onPressed: () {},
          mini: true,
        )
      ],
    );
  }

  Widget _form() {
    bool checkBoxValue = false;
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [primaryTheme, Colors.green])),
        height: 400,
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Center(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                _spacing(30),
                email(),
                _spacing(30),
                password(),
                _spacing(10),
                submit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _spacing(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget email() {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: "Enter email",
            prefixIcon: Icon(Icons.mail),
            fillColor: Colors.grey,
            enabledBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0))),
      ),
    );
  }

  Widget password() {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            prefixIcon: Icon(Icons.lock),
            labelText: "password"),
      ),
    );
  }

  Widget submit() {
    return RaisedButton(
      //  shape: ShapeBorders(),
      clipBehavior: Clip.hardEdge,
      color: submitButtonColor,
      elevation: 4,
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Text("Submit", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 90);

    path.quadraticBezierTo(
        size.width / 3, size.height - 5, size.width, size.height);
    path.lineTo(size.width, size.height - 50);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
