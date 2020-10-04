import 'dart:ui';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:ui/colorConstants.dart';
import 'package:ui/screens/ApplicationForms/Qualifications/qualificationSubmitButton.dart';
import '../utility.dart';
import 'package:intl/intl.dart';

class QualificationForms extends StatefulWidget {
  @override
  _QualificationFormsState createState() => _QualificationFormsState();
}

class _QualificationFormsState extends State<QualificationForms>
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
      appBar: appBar("Create Qualification"),
      body: Container(
        child: Stack(
          children: [
            Container(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  border: Border.all(color: Colors.white),
                ),
                child: Form(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          textformfield("Institution"),
                          dates("Date From"),
                          dates("Date to"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropDownFormField(
                              titleText: 'Qualification',
                              hintText: "Select qualification",
                              value: _myActivity,
                              onSaved: (value) {
                                setState(() {
                                  _myActivity = value;
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  _myActivity = value;
                                });
                              },
                              dataSource: [
                                {
                                  "value": "Higher National Diploma",
                                  "display": "Higher National Diploma"
                                },
                                {
                                  "value": "Bachelor's Degree",
                                  "display": "Bachelor's Degree"
                                },
                                {
                                  "value": "Master's Degree",
                                  "display": "Master's Degree"
                                }
                              ],
                              valueField: "value",
                              textField: "display",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropDownFormField(
                              titleText: 'Our Related Academic program',
                              hintText: "Select qualification",
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
                          QualificationsSubmit(),
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
