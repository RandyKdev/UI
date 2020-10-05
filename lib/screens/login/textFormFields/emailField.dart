import 'package:flutter/material.dart';

import '../formProps.dart';

class EmailField extends StatelessWidget {
  EmailField({this.signInForm: true});
  final bool signInForm;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: emailFocus,
      controller: emailController,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        if(signInForm) signInKey.currentState.validate();
        else signUpKey.currentState.validate();
        FocusScope.of(context).requestFocus(passwordFocus);
      },
      validator: (email) {

        RegExp exp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
        if(email.trim().isEmpty) return "Please enter email";
        if(exp.hasMatch(email)) return null;
        else return "Enter a valid email";
      },
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
      ),
    );
  }
}
