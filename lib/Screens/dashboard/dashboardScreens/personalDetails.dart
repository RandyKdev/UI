import 'package:flutter/material.dart';
import 'package:ui/colorConstants.dart';

import 'customText.dart';

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 9.0),
          child: Center(
            child: Text(
              "Application Profile",
              maxLines: 2,
              style: TextStyle(
                  fontSize: 15,
                  color: primaryTheme,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0, left: 8.0, right: 8.0),
          child: Divider(
            height: 2.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0, left: 2, right: 2),
          child: Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: columnText("Profile Title")),
                  DataColumn(label: columnText("Names")),
                  DataColumn(label: columnText("Gender")),
                  DataColumn(label: columnText("Personal Email")),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell.empty,
                    DataCell.empty,
                    DataCell.empty,
                    DataCell.empty,
                  ]),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
            child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  backgroundColor: secondaryTheme,
                  onPressed: () {
                    Navigator.pushNamed(context, '/personalDetails');
                  },
                )),
          ),
        )
      ],
    ));
  }
}
