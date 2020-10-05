import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/colorConstants.dart';
import 'package:ui/screens/ApplicationForms/Work%20Experience/workExperienceForm.dart';
import 'package:ui/screens/dashboard/dashboardScreens/personalDetails.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String username = '';
  void updateState(String user) {
    setState(() => username = user);
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 0), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String user = prefs.getString('username');
      if (username.length == 0) updateState(user);
    });
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: double.infinity,
      width: width * 0.79,
      child: Drawer(
        elevation: 20,
        child: Column(
          children: [
            Container(
              color: primaryTheme,
              height: height * 0.3,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, bottom: 10, right: 10),
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: primaryTheme,
                        radius: 50,
                        child: Icon(
                          Icons.account_circle,
                          size: 110,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Center(
                      child: Text(
                    username,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                size: 30,
                color: primaryTheme,
              ),
              title: Text(
                "Home",
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
            _divider(),
            _popUpMenu(),
            _divider(),
            ListTile(
              leading: Icon(
                Icons.account_box,
                color: primaryTheme,
              ),
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {},
            ),
            _divider(),
            ListTile(
              leading: Icon(
                Icons.dashboard,
                size: 30,
                color: primaryTheme,
              ),
              title: Text(
                "Dashboard",
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/dashboard');
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.15),
              child: _divider(),
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Icon(
                Icons.exit_to_app,
                color: primaryTheme,
              ),
              title: Text(
                "Sign out ($username)",
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                signOut();
                Navigator.of(context).pushReplacementNamed('/login');
              },
            )
          ],
        ),
      ),
    );
  }

  void signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.setInt('loggedIn', 0);
  }

  Widget _popUpMenu() {
    return PopupMenuButton(
      child: ListTile(
        leading: Icon(
          Icons.add_circle,
          color: primaryTheme,
        ),
        trailing: Icon(
          Icons.arrow_drop_down,
          color: primaryTheme,
        ),
        title: Text(
          "New Admissions",
          style: TextStyle(fontSize: 15),
        ),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        PopupMenuItem(
          child: Text(
            "Personal Details",
          ),
          value: 0,
        ),
        PopupMenuItem(
          child: Text("Work Experiencce"),
          value: 1,
        ),
        PopupMenuItem(child: Text("Qualifications"), value: 2),
        
        PopupMenuItem(
          child: Text("Application Details"),
          value: 3,
        ),
        PopupMenuItem(
          child: Text("Document Details"),
          value: 4,
        ),
      ],
      onSelected: (value) {
        switch (value) {
          case 0:
            return Navigator.pushNamed(context, '/personalDetails');
            break;
          case 1:
            return Navigator.pushNamed(context, '/workExperience');
            break;
           case 2:
            return Navigator.pushNamed(context, '/qualificationDetails');
            break;
          case 3:
            return Navigator.pushNamed(context, '/createApplication');
            break;
          case 4:
            return Navigator.pushNamed(context, '/documentDetails');
            break;
        }
      },
    );
  }
}

Widget _divider() {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: Divider(
      thickness: 1.5,
    ),
  );
}
