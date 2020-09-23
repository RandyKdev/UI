import 'package:flutter/material.dart';

double height;
double width;

class ScreenSizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
  }
}
