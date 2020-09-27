import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Username',
        prefixIcon: Icon(Icons.verified_user),
      ),
    );
  }
}
