import 'package:flutter/material.dart';
import 'package:ui/colorConstants.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              ClipPath(
                clipper: MyCustomPainter(),
                child: Container(
                  height: screenheight,
                  width: screenWidth,
                  color: primaryTheme,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign in",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100, left: 15, right: 15),
                child: Opacity(
                  opacity: 0.7,
                  child: Card(
                    elevation: 40,
                    child: Container(
                      // margin: EdgeInsets.only(top: 100),
                      height: 400,
                      child: Form(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _email(),
                              _password(),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Text("Forgot password?"),
                              ),
                              _submit(),
                              Row(
                                children: [
                                  Expanded(child: Divider()),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('or login with',
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                  Expanded(child: Divider())
                                ],
                              ),
                              _icons()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenheight - 30,
                left: screenWidth / 6,
                child: Row(
                  children: [
                    Text("I don't have an Account!"),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "Register here",
                          style: TextStyle(color: submitButtonColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _email() {
  return Padding(
    padding: const EdgeInsets.all(10.5),
    child: TextFormField(
      decoration:
          InputDecoration(labelText: "email", prefixIcon: Icon(Icons.email)),
    ),
  );
}

Widget _password() {
  return Padding(
    padding:
        const EdgeInsets.only(top: 15, bottom: 15, left: 10.5, right: 10.5),
    child: TextFormField(
      decoration: InputDecoration(
          labelText: "password",
          prefixIcon: Icon(Icons.lock),
          suffixIcon: Icon(Icons.visibility_off)),
    ),
  );
}

Widget _submit() {
  return Padding(
    padding: const EdgeInsets.only(top: 15, bottom: 15),
    child: Center(
      child: RaisedButton(
        autofocus: true,
        color: submitButtonColor,
        disabledColor: Colors.red,
        onPressed: () {},
        child: Text(
          "Submit",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

Widget _icons() {
  return Padding(
    padding: const EdgeInsets.only(top: 15, bottom: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          child: Icon(Icons.home),
        ),
        CircleAvatar(
          child: Icon(Icons.info),
        ),
        CircleAvatar(child: Icon(Icons.lock_open))
      ],
    ),
  );
}

class MyCustomPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height * 0.6);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.8, size.width, size.height * 0.6);
    path.lineTo(size.width, size.height * 0.6);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
