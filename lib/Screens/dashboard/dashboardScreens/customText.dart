import 'package:flutter/material.dart';
import 'package:ui/colorConstants.dart';

Widget columnText(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 14, color: purple, fontWeight: FontWeight.w500),
  );
}

Widget pageHeader(String text) {
  return Text(
    text,
    maxLines: 1,
    style: TextStyle(
        color: primaryTheme, fontWeight: FontWeight.bold, fontSize: 15),
  );
}
