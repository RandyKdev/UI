import 'package:flutter/material.dart';
import 'package:ui/screens/login/utils/animatedCrossFade.dart';

import 'dart:math';
import '../../../colorConstants.dart';

class SocialSignInButtons extends StatefulWidget {
  @override
  _SocialSignInButtonsState createState() => _SocialSignInButtonsState();
  SocialSignInButtons(this.showingSignIn);
  final bool showingSignIn;
}

class _SocialSignInButtonsState extends State<SocialSignInButtons> {
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

  AnimatedCrossFadeUtil _button(IconData icon) {
    return AnimatedCrossFadeUtil(
      showingSignIn: widget.showingSignIn,
      firstChild: _icons(
        icon: icon,
        color: Colors.white,
        bgColor: secondaryTheme,
      ),
      secondChild: _icons(
        icon: icon,
        color: primaryTheme,
        bgColor: Colors.white,
      ),
    );
  }
}

CircleAvatar _icons({IconData icon, Color color, Color bgColor}) =>
    CircleAvatar(
      child: Icon(
        icon,
        size: 30,
        color: color,
      ),
      backgroundColor: bgColor,
      radius: 30,
    );
