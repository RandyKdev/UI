import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/colorConstants.dart';
import 'package:ui/screens/ApplicationForms/Work%20Experience/workExperienceForm.dart';

enum forms {
  personalDetails,
  workExperience,
  qualification,
  parentsDetails,
  documents,
  createApplication,
  payApplicationFees
}

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
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Widget>>[
        PopupMenuItem(
          child: Text("Personal Details"),
        ),
        PopupMenuItem(
          child: Text("Work Experiencce"),
        ),
        PopupMenuItem(
          child: Text("Qualifications"),
          value: Container(),
        ),
        PopupMenuItem(child: Text("Personal Information")),
        PopupMenuItem(child: Text("Application Details")),
        PopupMenuItem(child: Text("Document Details")),
      ],
      onSelected: (value) {
        setState(() {
          switch (value) {
            case Container:
              return Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WorkExperienceForms()));
          }
        });
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
