import 'package:flutter/material.dart';
import 'package:ui/screens/login/utils/showAlertDialog.dart';

import '../formProps.dart';
import '../../../models/user.dart';
import '../../../database/dbprovider.dart';

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
  LoginButton({this.bgColor, this.text, this.signInForm: true, this.animate});
  final Color bgColor;
  final String text;
  final bool signInForm;
  final Function animate;
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
          onPressed: () => login(context),
        ),
      ),
    );
  }

  void login(BuildContext context) async {
    setState(() => loading = true);
    if (widget.signInForm && signInKey.currentState.validate()) {
      int user = await DBProvider.db.signIn(
        User(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
        if (user != null) {
          //save the id and change the login variable to true in shared preferences
          print(user);
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          setState(() => loading = false);
          showDialog(
              context: context,
              builder: (context) {
                return ShowAlertDialog(
                    title: 'User Not Found!',
                    body:
                        "Wrong Email or password.\nDon't have an account? Sign Up",
                    type: 2,
                    animate: widget.animate);
              });
        }
    }
    else if (!widget.signInForm && signUpKey.currentState.validate()) {
      bool userExist = await DBProvider.db.checkUser(emailController.text);
      if (userExist) {
        setState(() => loading = false);
        showDialog(
            context: context,
            builder: (context) {
              return ShowAlertDialog(
                  title: 'User Already Exists',
                  body: "Consider signing in",
                  type: 1,
                  animate: widget.animate);
            });
      } else {
        int userId = await DBProvider.db.newUser(
          User(
            email: emailController.text,
            password: passwordController.text,
            username: usernameController.text,
          ),
        );
        User userLoged = await DBProvider.db.getUser(userId);
        //store userinfo in sharedPreferences
          Navigator.pushReplacementNamed(context, '/home');
      }
    } else setState(() => loading = false);
  }
}
