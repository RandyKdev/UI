import 'package:flutter/material.dart';

class AnimatedCrossFadeUtil extends StatelessWidget {
  AnimatedCrossFadeUtil({
    this.showingSignIn,
    this.firstChild,
    this.secondChild,
  });
  final bool showingSignIn;
  final Widget firstChild, secondChild;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 1000),
      crossFadeState:
          showingSignIn ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: firstChild,
      secondChild: secondChild,
    );
  }
}
