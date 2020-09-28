import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator: (email) {
        RegExp exp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
        if(email.trim().isEmpty) {
          return "Please enter email";
        }
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
