import 'package:flutter/material.dart';
import 'package:ui/Screens/dashBoardScreens.dart';

import 'SideNavigtion/customSideBar.dart';

class DashBoardBody extends StatefulWidget {
  @override
  _DashBoardBodyState createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      CustomNavigationBar(),
      Expanded(
        child: Container(
          child: Center(
            child: Text("Personal Details"),
          ),
        ),
      )
    ]));
  }
}
