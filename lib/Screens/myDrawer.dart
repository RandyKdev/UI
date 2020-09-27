import 'package:flutter/material.dart';

import 'package:ui/colorConstants.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.only(top: 25, bottom: 10),
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
                    "Jan_Royal",
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
              onTap: () {},
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
                "Sign out (Jan_Royal)",
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    );
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
          "Admissions",
          style: TextStyle(fontSize: 15),
        ),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Widget>>[
        PopupMenuItem(child: Text("hi")),
        PopupMenuItem(
          child: Text("ji"),
        )
      ],
    );
  }
}

Widget _divider() {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
    child: Divider(
      thickness: 1.5,
    ),
  );
}
