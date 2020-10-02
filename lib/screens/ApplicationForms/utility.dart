import 'package:flutter/material.dart';

Widget appBar(String text) {
  return AppBar(
    bottomOpacity: 5.7,
    elevation: 10,
    title: Text(
      text,
      style: TextStyle(color: Colors.white),
    ),
  );
}
