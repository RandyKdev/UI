import 'package:flutter/material.dart';

import 'package:ui/screens/dashBoardScreens.dart';
import 'SideNavigtion/customSideBar.dart';

class DashBoardBody extends StatefulWidget {
  @override
  _DashBoardBodyState createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardBody> {
  int pageIndex = 0;
  void changeIndex(index) => setState(() => pageIndex = index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CustomNavigationBar(index: pageIndex, changeIndex: changeIndex),
          Expanded(
            child: Container(
              color: Colors.white,
              child: _dashBoardScreens(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dashBoardScreens() {
    switch (pageIndex) {
      case 0:
        return PersonalDetails();
        break;
      case 1:
        return WorkExperience();
        break;
      case 2:
        return Qualifications();
        break;
      case 3:
        return PersonalDetails();
        break;
      case 4:
        return WorkExperience();
        break;
      case 5:
        return Qualifications();
        break;
      case 6:
        return PersonalDetails();
        break;
      case 7:
        return Qualifications();
        break;
      default:
        return null;
    }
  }
}
