import 'package:flutter/material.dart';
import 'SideNavigtion/customSideBar.dart';

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Personal Details Screen"),
    );
  }
}

class WorkExperience extends StatefulWidget {
  @override
  _WorkExperienceState createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Work Experience Screen"),
    );
  }
}

class Qualifications extends StatefulWidget {
  @override
  _QualificationsState createState() => _QualificationsState();
}

class _QualificationsState extends State<Qualifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Qualifications Screen"),
    );
  }
}
