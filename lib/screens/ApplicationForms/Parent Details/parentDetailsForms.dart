import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui/colorConstants.dart';
import 'package:ui/screenSizeGetters.dart';
import 'package:ui/screens/ApplicationForms/utilityWidgets.dart';

import 'submitButton.dart';

class ParentDetailsForms extends StatefulWidget {
  @override
  _ParentDetailsFormsState createState() => _ParentDetailsFormsState();
}

class _ParentDetailsFormsState extends State<ParentDetailsForms>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  double _overlap = 2.0;
//# prevents on Screen keyboard from displace Scholar Copyright logo
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
//#

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
                    //border: Border.all(),
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
            scholarCopyright(_overlap),
          ],
        ),
      ),
    );
  }

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
