import 'package:flutter/material.dart';
import 'package:ui/colorConstants.dart';

import './screens/home/view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: primaryTheme),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
