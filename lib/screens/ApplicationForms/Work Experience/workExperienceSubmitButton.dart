import 'package:flutter/material.dart';

import '../../../colorConstants.dart';

class WorkExperienceSubmit extends StatefulWidget {
  @override
  _WorkExperienceSubmitState createState() => _WorkExperienceSubmitState();
}

class _WorkExperienceSubmitState extends State<WorkExperienceSubmit> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: !loading ? width * 0.50 : 55,
        height: 55,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: RaisedButton(
            padding: EdgeInsets.all(20),
            color: primaryTheme,
            child: !loading
                ? Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  )
                : CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 3,
                  ),
            onPressed: () {
              setState(() {
                loading = !loading;
              });
            },
          ),
        ),
      ),
    );
  }
}
