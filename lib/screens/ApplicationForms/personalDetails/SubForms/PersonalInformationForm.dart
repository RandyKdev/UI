import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:ui/database/nameConstants.dart';
import 'package:ui/screens/ApplicationForms/ApplicationFormkeys.dart';
import 'package:ui/screens/ApplicationForms/utilityWidgets.dart';
import 'package:country_code_picker/country_code_picker.dart';

class PersonalInformationForm extends StatefulWidget {
  @override
  _PersonalInformationFormState createState() =>
      _PersonalInformationFormState();
}

class _PersonalInformationFormState extends State<PersonalInformationForm> {
  String _myActivity;
  String _myActivity1;
  String _myActivityResult;
  @override
  void initState() {
    super.initState();
    _myActivity = "";
    _myActivity1 = "";
    _myActivityResult = "";
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
              child: Form(
            key: personalDetailsKey,
            child: Column(
              children: [
                steppertitle('Personal Details'),
                //
                textFormfield("Project Title", 0),
                textFormfield("First Name", 1),
                textFormfield("Last Name", 2),
                textFormfield("Middle Name", 3),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropDownFormField(
                    titleText: 'Gender',
                    hintText: "choose Gender",
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
                      {"value": "Male", "display": "Male"},
                      {"value": "Female", "display": "Female"},
                    ],
                    valueField: "value",
                    textField: "display",
                  ),
                ),
                dates("Date of Birth"),
                textFormfield("Place of Birth", 4),
                country(),
                textFormfield("Mother Tongue", 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropDownFormField(
                    titleText: 'RELIGION',
                    hintText: "select religion",
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
                      {"value": "Christianity", "display": "Christianity"},
                      {"value": "Other", "display": "Other"},
                    ],
                    valueField: "value",
                    textField: "display",
                  ),
                ),
                textFormfield("Current Qualification", 6),
              ],
            ),
          )),
        ),
      ),
    );
  }

  Widget textFormfield(String label, int fieldId) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: TextFormField(
        controller: fieldController,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Field Cannot be empty';
          }
          return null;
        },
      ),
    );
  }

  final format = DateFormat("yyyy-MM-dd");

  Widget dates(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 10.0, right: 10.0),
      child: DateTimeField(
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.calendar_today),
          labelText: title,
          labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
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

  Widget country() {
    return Container(
        child: CountryCodePicker(
      initialSelection: 'CM',
      showCountryOnly: true,
    ));
  }
}
