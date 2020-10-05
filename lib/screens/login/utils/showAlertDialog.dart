import 'package:flutter/material.dart';

import 'package:ui/colorConstants.dart';

class ShowAlertDialog extends StatelessWidget {
  ShowAlertDialog({this.title, this.body, this.type, this.animate});
  final String title;
  final String body;
  final int type;
  final Function animate;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        type != 0
            ? RaisedButton(
                color: purple,
                child: Text(type == 1 ? 'Sign In' : 'Sign Up'),
                onPressed: () {
                  animate();
                  Navigator.pop(context);
                },
              )
            : null,
        FlatButton(
          child: Text(
            "Try again",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
