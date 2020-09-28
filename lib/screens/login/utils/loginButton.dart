import 'package:flutter/material.dart';

import '../keys.dart';

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

  void login() {
    setState(() {
      loading = !loading;
    });
    if(widget.signInForm && signInKey.currentState.validate()) {
      return null;
    }
    if(!widget.signInForm && signUpKey.currentState.validate()) {
      return null;
    }
  }
}
