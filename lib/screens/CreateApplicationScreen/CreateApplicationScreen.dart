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
                    children: <Widget>[DropDownField()],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
