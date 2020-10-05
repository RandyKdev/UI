import 'package:flutter/material.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
import 'package:ui/colorConstants.dart';
import 'package:ui/models/contactDetails.dart';
import 'package:ui/models/personalInformation.dart';
import 'package:ui/screens/ApplicationForms/ApplicationFormkeys.dart';
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
            decoration: BoxDecoration(color: purple),
            child: IconStepper.externallyControlled(
              goNext: goNext,
              goPrevious: goPrevious,
              direction: Axis.horizontal,
              stepColor: Colors.white,
              activeStepColor: primaryTheme,
              lineColor: primaryTheme,
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
          Container(
            color: primaryTheme,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (show == 0)
                      ? Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 2),
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "\u00a9 Scholar 2020",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        )
                      : RaisedButton(
                          color: primaryTheme,
                          onPressed: () {
                            // MUST TO CONTROL STEPPER FROM EXTERNAL BUTTONS.
                            setState(() {
                              goNext = false;
                              goPrevious = true;
                              if (currentIndex > 0) {
                                currentIndex--;
                                show = currentIndex;
                              }
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              Text(
                                'Previous',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                  RaisedButton(
                    elevation: 20,
                    color: primaryTheme,
                    onPressed: () {
                      // MUST TO CONTROL STEPPER FROM EXTERNAL BUTTONS.
                      setState(() {
                        show++;
                        print(show);
                        goNext = true;
                        goPrevious = false;
                        if (currentIndex < 3) {
                          currentIndex++;
                        }
                      });
                    },
                    child: Row(
                      children: [
                        currentIndex == 2
                            ? Text("Save Form",
                                style: TextStyle(color: Colors.white))
                            : Text('Next',
                                style: TextStyle(color: Colors.white)),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_ios, color: Colors.white)
                      ],
                    ),
                  )
                ],
              ),
            ),
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
