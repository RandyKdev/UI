import 'package:flutter/material.dart';
import 'package:ui/colorConstants.dart';
import 'package:dropdownfield/dropdownfield.dart';

class CreateApplication extends StatefulWidget {
  @override
  _CreateApplicationState createState() => _CreateApplicationState();
}

class _CreateApplicationState extends State<CreateApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryTheme,
        title: Text(
          "CREATE APPLICATIONS",
          style: TextStyle(color: purple),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Apply For A Program',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontStyle: FontStyle.normal),
                ),
                Text(
                  'Application Details',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 30,
                      fontStyle: FontStyle.normal),
                ),
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 40),
                      Text(
                        'Campus',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.normal),
                      ),
                      DropDownField(
                          controller: campusSelected,
                          hintText: "Select Campus",
                          enabled: true,
                          items: campus,
                          itemsVisibleInDropdown: 2,
                          onValueChanged: (value) {
                            setState(() {
                              selectCampus = value;
                            });
                          }),
                      SizedBox(height: 40),
                      Text(
                        'Program',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.normal),
                      ),
                      DropDownField(
                          controller: programSelected,
                          hintText: "Select Program",
                          enabled: true,
                          items: program,
                          itemsVisibleInDropdown: 4,
                          onValueChanged: (value) {
                            setState(() {
                              selectProgram = value;
                            });
                          }),
                      SizedBox(height: 40),
                      Text(
                        'Profile Name',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.normal),
                      ),
                      DropDownField(
                          controller: profileSelected,
                          hintText: "Select Profile to Apply With",
                          enabled: true,
                          items: profile,
                          itemsVisibleInDropdown: 2,
                          onValueChanged: (value) {
                            setState(() {
                              selectProgram = value;
                            });
                          }),
                      SizedBox(height: 40),
                      Text(
                        'Study Mode',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.normal),
                      ),
                      DropDownField(
                          controller: studymodeSelected,
                          hintText: "Select Mode Of Study",
                          enabled: true,
                          items: studymode,
                          itemsVisibleInDropdown: 4,
                          onValueChanged: (value) {
                            setState(() {
                              selectStudyMode = value;
                            });
                          }),
                      SizedBox(height: 40),
                      Text(
                        'Admission Type',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.normal),
                      ),
                      DropDownField(
                          controller: admissionSelected,
                          hintText: "",
                          enabled: true,
                          items: admission,
                          itemsVisibleInDropdown: 2,
                          onValueChanged: (value) {
                            setState(() {
                              selectAdmission = value;
                            });
                          }),
                      SizedBox(height: 40),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

String selectCampus = "";
String selectProgram = "";
String selectProfile = "";
String selectAdmission = "";
String selectStudyMode = "";

final campusSelected = TextEditingController();
final programSelected = TextEditingController();
final profileSelected = TextEditingController();
final admissionSelected = TextEditingController();
final studymodeSelected = TextEditingController();

List<String> campus = [
  "Buea Campus",
];
List<String> program = [
  "Software Engineering",
  "Food And Nutrition",
  "Logistics And Transport",
];
List<String> profile = [
  "",
];
List<String> admission = [
  "Regular",
  "Top-Up",
  "Transfer",
];
List<String> studymode = ["Campus", "Online", "Hybrid", "Distance Learning"];
