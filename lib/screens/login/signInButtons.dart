import 'package:flutter/material.dart';

import 'dart:math';

class SignInButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi * 0.15,
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 30),
            _button(Icons.filter_none),
            SizedBox(width: 30),
            _button(Icons.event),
            SizedBox(width: 30),
            _button(Icons.home),
          ],
        ),
      ),
    );
  }

  CircleAvatar _button(IconData icon) {
    return CircleAvatar(
      child: Icon(
        icon,
        size: 30,
      ),
      radius: 30,
    );
  }
}
