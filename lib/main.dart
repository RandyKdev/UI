import 'package:flutter/material.dart' ;

import './screens/splash/splash.dart';

void main() {
  runApp(ScholarApp());
 }

class ScholarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
  }
}