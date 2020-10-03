import 'package:flutter/material.dart';
import 'package:ui/colorConstants.dart';
import 'package:ui/screens/CreateQualificationScreen/CreateQualificationScreen.dart';

import './screens/home/view.dart';
import './screens/login/view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryTheme,
        primaryColorLight: primaryTheme,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CreateQualification(),
        '/home': (context) => Home(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
