import 'package:flutter/material.dart';

import '../formProps.dart';

class PasswordField extends StatelessWidget {
  PasswordField({this.signInForm: true});
  final bool signInForm;
  final List<int> arr = [0,1,2,3,4,5,6,7,8,9];
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      focusNode: passwordFocus,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) {
        if(signInForm) {signInKey.currentState.validate();}
        else {signUpKey.currentState.validate();}
        FocusScope.of(context).unfocus();
      },
      validator: (password) {
        password = password.trim();
        if(password.isEmpty) return 'Please enter a password';
        if(!signInForm) {
          if(password.length < 8) return 'Password must be longer than 7 characters';
          if(!customRegex(password)) return 'Password must contain atleast one number';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock),
      ),
      obscureText: true,
    );
  }

  bool customRegex(String password) {
    bool found = false;
    for(int i = 0; i < 10; i++) {
      if(password.contains(arr[i].toString())) found = true;
    }
    return found;
  }
}
