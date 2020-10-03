import 'package:flutter/material.dart';

class CreateQualification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("CREATE APPLICATIONS"),
        leading: Icon(
          Icons.arrow_back,
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
          ],
        ),
      ),
    );
  }
}
