import 'package:flutter/material.dart';
import 'package:ui/screens/ApplicationForms/ApplicationFormkeys.dart';
import 'package:ui/screens/ApplicationForms/utilityWidgets.dart';

class ContactDetailsForm extends StatefulWidget {
  @override
  _ContactDetailsFormState createState() => _ContactDetailsFormState();
}

class _ContactDetailsFormState extends State<ContactDetailsForm> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
              child: Scrollbar(
            child: SingleChildScrollView(
              child: Form(
                key: contactDetailskey,
                child: Column(
                  children: [
                    steppertitle("Contact Details"),
                    //
                    textField('Present Address'),
                    textField('Permanent Adress'),
                    textField('State/Region'),
                    textField('City'),
                    numberFields('Phone(Include zip code)'),
                    numberFields('Mobile(Include zip code)'),
                    email()
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }

  Widget numberFields(String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
        ),
      ),
    );
  }

  Widget textField(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: text,
            labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
      ),
    );
  }

  Widget email() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
      ),
    );
  }
}
