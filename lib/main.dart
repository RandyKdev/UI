import 'package:flutter/material.dart';

import 'Screens/Login/Login.dart';

void main() {
  runApp(ScholarApp());
}

class ScholarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SignUp(),
    );
  }
}
