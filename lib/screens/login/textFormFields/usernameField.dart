import 'package:flutter/material.dart';

import '../formProps.dart';

class UsernameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: usernameController,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) { 
        signUpKey.currentState.validate();
        FocusScope.of(context).requestFocus(emailFocus);
      },
      validator: (username) {
        username = username.trim();
        if(username.length == 0) return 'Please enter username';
      if(username.length < 2) return "Username must be longer than 1 character";
      return null;
      },
      decoration: InputDecoration(
        labelText: 'Username',
        prefixIcon: Icon(Icons.verified_user),
      ),
    );
  }
}