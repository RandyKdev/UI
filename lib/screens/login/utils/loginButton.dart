import 'package:flutter/material.dart';

import '../keys.dart';
import '../../../models/user.dart';
import '../../../database/dbprovider.dart';

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
  LoginButton({this.bgColor, this.text, this.signInForm: true});
  final Color bgColor;
  final String text;
  final bool signInForm;
}

class _LoginButtonState extends State<LoginButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: !loading ? width * 0.50 : 55,
      height: 55,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: RaisedButton(
          padding: EdgeInsets.all(20),
          color: widget.bgColor,
          child: !loading
              ? Text(
                  widget.text,
                  style: TextStyle(color: Colors.white),
                )
              : CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 3,
                ),
          onPressed: login,
        ),
      ),
    );
  }

  void login() async {
    setState(() {
      loading = !loading;
    });
    if (widget.signInForm && signInKey.currentState.validate()) {
      DBProvider.db.signIn(User(
        email: emailController.text,
        password: passwordController.text,
      ),).then((user) {
        if(user != null) {
          //save the id and change the login variable to true in shared preferences
          print(user);
        }
        else {
          print("no user found");
        }
      });
      
    }
    if (!widget.signInForm && signUpKey.currentState.validate()) {
      DBProvider.db.newUser(
        User(
          email: emailController.text,
          password: passwordController.text,
          username: usernameController.text,
        ),
      ).then((userId) => print(userId));
    }
  }
}
