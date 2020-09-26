import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextFormField _username = TextFormField(
      decoration: InputDecoration(
        labelText: 'Username',
        prefixIcon: Icon(Icons.verified_user),
      ),
    );
    TextFormField _email = TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
      ),
    );
    TextFormField _password = TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock),
      ),
      obscureText: true,
    );
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _username,
          SizedBox(height: 20),
          _email,
          SizedBox(height: 20),
          _password,
          SizedBox(height: 20),
          FlatButton(
            child: Text('Already have an account? Sign In'),
            onPressed: () {},
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: width * 0.7,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: RaisedButton(
                  padding: EdgeInsets.all(20),
                  color: Colors.blueAccent,
                  child: Text('Create Account'),
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
