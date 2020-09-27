import 'package:flutter/material.dart';
import 'package:ui/screens/login/textFormFields/emailField.dart';
import 'package:ui/screens/login/textFormFields/passwordField.dart';
import 'package:ui/screens/login/textFormFields/usernameField.dart';
import 'package:ui/screens/login/utils/loginButton.dart';

import '../../../colorConstants.dart';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UsernameField(),
          SizedBox(height: 20),
          EmailField(),
          SizedBox(height: 20),
          PasswordField(),
          SizedBox(height: 20),
          FlatButton(
            child: Text('Already have an account? Sign In'),
            onPressed: () {},
          ),
          SizedBox(height: 30),
          _signUpButton(width),
        ],
      ),
    );
  }

  Widget _signUpButton(double width) => Align(
        alignment: Alignment.center,
        child: LoginButton(
          bgColor: secondaryTheme,
          text: 'Create Account',
        ),
      );
}
