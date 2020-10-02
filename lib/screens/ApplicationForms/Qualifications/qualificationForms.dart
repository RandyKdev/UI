import 'package:flutter/material.dart';
import 'package:ui/colorConstants.dart';
import '../utility.dart';

class QualificationForms extends StatefulWidget {
  @override
  _QualificationFormsState createState() => _QualificationFormsState();
}

class _QualificationFormsState extends State<QualificationForms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("New Qualifications"),
      body: Container(
        child: Stack(
          children: [
            Container(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black87),
              ),
              child: Form(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
