import 'package:flutter/material.dart';
import 'Screens/dashBoardHeader.dart';

void main() {
  runApp(ScholarApp());
}

class ScholarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashBoard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
