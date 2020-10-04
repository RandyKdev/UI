import 'package:flutter/material.dart';
import 'package:ui/colorConstants.dart';
import 'package:ui/screens/ApplicationForms/personalDetails/personalDetailsForms.dart';

import 'screens/ApplicationForms/Parent Details/parentDetailsForms.dart';
import 'screens/ApplicationForms/Qualifications/qualificationForms.dart';

//import './screens/home/view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: primaryTheme),
      home: QualificationForms(),
      debugShowCheckedModeBanner: false,
    );
  }
}
