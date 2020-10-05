import 'package:flutter/material.dart';

import '../SideNavigtion/customSideBar.dart';
import 'dashboardScreens/personalDetails.dart';
import 'dashboardScreens/Qualifications.dart';
import 'dashboardScreens/workExperience.dart';
import 'dashboardScreens/payfees.dart';
import 'dashboardScreens/documents.dart';
import 'dashboardScreens/createApplication.dart';
import 'dashboardScreens/parentdetails.dart';
//import 'dashboardScreens/done.dart';

class DashBoardBody extends StatefulWidget {
  @override
  _DashBoardBodyState createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardBody> {
  int pageIndex = 0;

  void changeIndex(index) => setState(() {
        pageIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CustomNavigationBar(
            index: pageIndex,
            changeIndex: changeIndex,
            // width: ,
          ),
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
        return ParentDetails();
        break;
      case 4:
        return Documents();
        break;
      case 5:
        return CreateApplication();
        break;
      case 6:
        return PayFees();
        break;
      case 7:
        return AlertDialog(
          title: Text("Submit"),
          content: Text(
              "Do you want to submit forms, you will not be able to edit later"),
          actions: [
            FlatButton(
              child: Text("Yes"),
              onPressed: () {},
            ),
            FlatButton(onPressed: () {}, child: Text("Cancel"))
          ],
        );
        break;

      default:
        return null;
    }
  }
}
