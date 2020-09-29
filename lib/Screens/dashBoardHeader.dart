import 'package:flutter/material.dart';

import 'package:ui/colorConstants.dart';
import 'myDrawer.dart';
import 'dashBoardBody.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),
       appBar: AppBar(
        backgroundColor: primaryTheme,
        bottomOpacity: 0.1,
        title: Text(
          "DashBoard",
          style: TextStyle(fontSize: 25),
        ),
        //  centerTitle: true,
      ),
      body: DashBoardBody(),
    );
  }
}
