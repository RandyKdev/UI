import 'package:flutter/material.dart';
import 'package:ui/colorConstants.dart';
import 'package:ui/screenSizeGetters.dart';
import 'package:ui/screens/ApplicationForms/utility.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/country.dart';

import 'submitButton.dart';

class ParentDetailsForms extends StatefulWidget {
  @override
  _ParentDetailsFormsState createState() => _ParentDetailsFormsState();
}

class _ParentDetailsFormsState extends State<ParentDetailsForms> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("New Parent Details"),
      body: Container(
        child: Stack(
          children: [
            Container(
              child: CustomPaint(
                painter: Painter(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  // borderRadius: BorderRadius.circular(10)),
                ),
                child: Form(
                  child: Scrollbar(
                    controller: _controller,
                    isAlwaysShown: true,
                    child: SingleChildScrollView(
                      controller: _controller,
                      child: Column(
                        children: [
                          textFormField('Full Names'),
                          textFormField('Relation'),
                          textFormField('Education'),
                          textFormField('Occupation'),
                          textFormField('Address'),
                          country(),
                          textFormField('State/Region'),
                          textFormField('City'),
                          textFormField('Phone'),
                          textFormField('Mobile'),
                          emailFormField('email'),
                          Submit(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 2),
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

  Widget textFormField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
            fillColor: purple,
            labelText: label,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      ),
    );
  }
}

Widget emailFormField(String s) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
    child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          fillColor: purple,
          labelText: s,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
    ),
  );
}

Widget country() {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8),
    child: TextFormField(
      decoration: InputDecoration(
          labelText: 'Country',
          fillColor: secondaryTheme,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      onTap: () {},
    ),
  );
}

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    paint.color = secondaryTheme;
    path.lineTo(0.0, 250);
    path.quadraticBezierTo(251, 251, 250, 0.0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
