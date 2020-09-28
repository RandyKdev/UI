import 'package:flutter/material.dart';
import 'package:ui/screens/login/textFormFields/emailField.dart';
import 'package:ui/screens/login/textFormFields/passwordField.dart';
import 'package:ui/screens/login/textFormFields/usernameField.dart';
import 'package:ui/screens/login/utils/loginButton.dart';

import '../../../colorConstants.dart';
import '../keys.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm(this.animate);
  final Function animate;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Form(
      key: signUpKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UsernameField(),
          SizedBox(height: 20),
          EmailField(),
          SizedBox(height: 20),
          PasswordField(signInForm: false,),
          SizedBox(height: 30),
          _signUpButton(width),
          SizedBox(height: 15),
          Align(
            alignment: Alignment.center,
                      child: FlatButton(
              child: Text('Already have an account? Sign In'),
              onPressed: animate,
            ),
          ),
        ],
      ),
    );
  }

  Widget _signUpButton(double width) => Align(
        alignment: Alignment.center,
        child: LoginButton(
          bgColor: secondaryTheme,
          text: 'Create Account',
          signInForm: false,
        ),
      );
}
