import 'package:flutter/material.dart';
import 'package:ui/screens/login/utils/animatedCrossFade.dart';

import '../../../colorConstants.dart';

class FloatingTransButton extends StatefulWidget {
  @override
  _FloatingTransButtonState createState() => _FloatingTransButtonState();
  FloatingTransButton({this.animate, this.showingSignIn});
  final Function animate;
  final bool showingSignIn;
}

class _FloatingTransButtonState extends State<FloatingTransButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.animate(),
      child: AnimatedCrossFadeUtil(
        showingSignIn: widget.showingSignIn,
        firstChild: _icon(
          bgColor: secondaryTheme,
          icon: Icons.arrow_upward,
        ),
        secondChild: _icon(
          bgColor: primaryTheme,
          icon: Icons.arrow_downward,
        ),
      ),
    );
  }

  Widget _icon({Color bgColor, IconData icon}) => CircleAvatar(
        radius: 15,
        child: Icon(
          icon,
          color: Colors.white,
        ),
        backgroundColor: bgColor,
      );
}
