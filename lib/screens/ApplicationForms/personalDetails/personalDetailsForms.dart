import 'package:flutter/material.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:ui/colorConstants.dart';
import 'package:ui/models/contactDetails.dart';
import 'package:ui/models/personalInformation.dart';
import 'package:ui/screens/ApplicationForms/personalDetails/SubForms/PersonalInformationForm.dart';
import 'package:ui/screens/ApplicationForms/personalDetails/SubForms/contactDetailForm.dart';
import '../utilityWidgets.dart';

class PersonalDetailsForms extends StatefulWidget {
  @override
  _PersonalDetailsFormsState createState() => _PersonalDetailsFormsState();
}

class _PersonalDetailsFormsState extends State<PersonalDetailsForms> {
  int show = 0;
  bool goNext = false;
  bool goPrevious = false;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("New Profile"),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1.0,
                  blurRadius: 2.0,
                )
              ],
              // borderRadius: BorderRadius.circular(5.0),
            ),
            child: IconStepper.externallyControlled(
              goNext: goNext,
              goPrevious: goPrevious,
              direction: Axis.horizontal,
              stepColor: Colors.white,
              activeStepColor: Colors.amber,
              lineColor: Colors.amberAccent,
              lineLength: 75,
              steppingEnabled: true,
              icons: [
                Icon(Icons.person),
                Icon(Icons.contact_phone),
                Icon(Icons.check),
              ],
            ),
          ),
          body(),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (show == 0)
                  ? Container()
                  : RaisedButton(
                      onPressed: () {
                        // MUST TO CONTROL STEPPER FROM EXTERNAL BUTTONS.
                        setState(() {
                          goNext = false;
                          goPrevious = true;
                          show--;
                          print(show);
                          if (currentIndex > 0) {
                            currentIndex--;
                          }
                        });
                      },
                      child: Text('Previous'),
                    ),
              RaisedButton(
                onPressed: () {
                  // MUST TO CONTROL STEPPER FROM EXTERNAL BUTTONS.
                  setState(() {
                    show++;
                    goNext = true;
                    goPrevious = false;
                    print(show);
                    if (currentIndex < 3) {
                      currentIndex++;
                    }
                  });
                },
                child: Text('Next'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return PersonalInformationForm();

      case 1:
        return ContactDetailsForm();

      case 2:
        return Container();
    }
  }
}
