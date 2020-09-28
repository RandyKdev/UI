import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (username) => _validateUsername(username),
      decoration: InputDecoration(
        labelText: 'Username',
        prefixIcon: Icon(Icons.verified_user),
      ),
    );
  }
}

String _validateUsername(String username) {
  username = username.trim();
      if(username.length < 2) return "Username must be longer than 1 character";
}
