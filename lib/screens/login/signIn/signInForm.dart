import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextFormField _usernameEmail = TextFormField(
      decoration: InputDecoration(
        labelText: 'Email/Username',
        prefixIcon: Icon(Icons.email),
      ),
    );
    TextFormField _password = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock),
      ),
    );
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _usernameEmail,
          SizedBox(height: 30),
          _password,
          SizedBox(height: 20),
          FlatButton(
            child: Text('Forgot Password?'),
            onPressed: () {},
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: width * 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: RaisedButton(
                  padding: EdgeInsets.all(20),
                  color: Colors.greenAccent,
                  child: Text('Sign In'),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
