import 'package:flutter/material.dart';
import 'package:ui/colorConstants.dart';

class CreateQualification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryTheme,
        title: Text(
          "CREATE APPLICATIONS",
          style: TextStyle(color: purple),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: purple,
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
                'Create Qualification',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontStyle: FontStyle.normal),
              ),
              Text(
                'Qualification Details',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 30,
                    fontStyle: FontStyle.normal),
              ),
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.school),
                      labelText: 'Institution',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.calendar_today),
                      labelText: 'From Date',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                      labelText: 'To Date',
                      prefixIcon: Icon(
                        Icons.calendar_today,
                      ),
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
