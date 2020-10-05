import 'package:flutter/material.dart';
import './screens/ApplicationForms/documents/view.dart';
import './screens/ApplicationForms/CreateApplicationScreen/CreateApplicationScreen.dart';
import './screens/dashboard/dashBoardHeader.dart';
import 'package:ui/screens/oneTimePage/view.dart';
import './screens/splash/view.dart';
import 'package:ui/colorConstants.dart';

import 'package:ui/screens/ApplicationForms/CreateApplicationScreen/CreateApplicationScreen.dart';
import 'screens/ApplicationForms/Work Experience/workExperienceForm.dart';
import 'screens/ApplicationForms/personalDetails/personalDetailsForms.dart';

import 'screens/ApplicationForms/Parent Details/parentDetailsForms.dart';
import 'screens/ApplicationForms/Qualifications/qualificationForms.dart';

//import './screens/home/view.dart';
import './screens/home/view.dart';
import './screens/login/view.dart';

void main() {
  runApp(ScholarApp());
}

class ScholarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme().copyWith(
            headline4: TextStyle(color: Colors.white),
            headline6: TextStyle(color: Colors.white),
          ),
        ),
        primaryColor: primaryTheme,
        primaryColorLight: primaryTheme,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/oneTimePage': (context) => OneTimePage(),
        '/dashboard': (context) => DashBoard(),
        '/workExperience': (context) => WorkExperienceForms(),
        '/personalDetails': (context) => PersonalDetailsForms(),
        '/parentDetails': (context) => ParentDetailsForms(),
        '/qualificationDetails': (context) => QualificationForms(),
        '/documentDetails': (context) => Documents(),
        '/createApplication': (context) => CreateApplication(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
