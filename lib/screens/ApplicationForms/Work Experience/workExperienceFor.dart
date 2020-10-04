import 'dart:ui';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:ui/screens/ApplicationForms/Work%20Experience/workExperienceSubmitButton.dart';
import '../../../colorConstants.dart';
import 'package:intl/intl.dart';
import '../utilityWidgets.dart';

class WorkExperienceForms extends StatefulWidget {
  @override
  _WorkExperienceFormsState createState() => _WorkExperienceFormsState();
}

class _WorkExperienceFormsState extends State<WorkExperienceForms>
    with WidgetsBindingObserver {
  String _myActivity;
  String _myActivity1;
  String _myActivityResult;
  double _overlap = 2.0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _myActivity = "";
    _myActivity1 = "";
    _myActivityResult = "";
  }

//# prevents on Screen keyboard from displace Scholar Copyright logo
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

//#
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // utitlity
      appBar: appBar("New Work Experience"),
      body: Container(
        child: Stack(
          children: [
            Container(
              child: CustomPaint(
                painter: Painter(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(),
                child: Form(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          textformfield("Company"),
                          textformfield("Role"),
                          dates("Date From"),
                          dates("Date to"),
                          descriptionField(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropDownFormField(
                              titleText: 'Our Related Academic program',
                              hintText: "select program",
                              value: _myActivity1,
                              onSaved: (value) {
                                setState(() {
                                  _myActivity1 = value;
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  _myActivity1 = value;
                                });
                              },
                              dataSource: [
                                {
                                  "value": "SoftWare Engineering",
                                  "display": "SoftWare Engineering"
                                },
                                {
                                  "value": "Bachelor's Degree",
                                  "display": "Food and Nutrition"
                                },
                                {
                                  "value": "Logistics and Transport",
                                  "display": "Logistics and Transport"
                                }
                              ],
                              valueField: "value",
                              textField: "display",
                            ),
                          ),
                          WorkExperienceSubmit(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, bottom: _overlap),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "\u00a9 Scholar 2020",
                    style: TextStyle(
                        color: primaryTheme,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }

  //# prevent on Screen keyboard from displace Scholar Copyright logo
  @override
  void didChangeMetrics() {
    final renderObject = context.findRenderObject();
    final renderBox = renderObject as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final widgetRect = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      renderBox.size.width,
      renderBox.size.height,
    );
    final keyboardTopPixels =
        window.physicalSize.height - window.viewInsets.bottom;
    final keyboardTopPoints = keyboardTopPixels / window.devicePixelRatio;
    final overlap = widgetRect.bottom - keyboardTopPoints;
    if (overlap >= 0) {
      setState(() {
        _overlap = overlap;
        print(_overlap);
      });
    }
  }
//#

  Widget textformfield(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }

  final format = DateFormat("yyyy-MM-dd");

  Widget dates(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 10.0, right: 10.0),
      child: DateTimeField(
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    );
  }
}
