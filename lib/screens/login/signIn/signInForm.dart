import 'package:flutter/material.dart';
import 'package:ui/screens/login/textFormFields/emailField.dart';
import 'package:ui/screens/login/textFormFields/passwordField.dart';
import 'package:ui/screens/login/utils/loginButton.dart';

import '../../../colorConstants.dart';
import '../formProps.dart';

class SignInForm extends StatelessWidget {
  SignInForm(this.animate);
  final Function animate;

 @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: signInKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EmailField(),
          SizedBox(height: 20),
          PasswordField(),
          SizedBox(height: 20),
          FlatButton(
            child: Text('Forgot Password?'),
            onPressed: () {},
          ),
          SizedBox(height: 20),
          _signInButton(width),
          SizedBox(height: 20),
          
        ],
      ),
    );
  }

  Widget _signInButton(double width) => Align(
        alignment: Alignment.centerRight,
        child: LoginButton(
          bgColor: primaryTheme,
          text: 'Sign In',
          animate: animate,
          ),
      );
}
