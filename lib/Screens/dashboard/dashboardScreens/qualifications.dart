import 'package:flutter/material.dart';

import '../../../colorConstants.dart';
import 'customText.dart';

class Qualifications extends StatefulWidget {
  @override
  _QualificationsState createState() => _QualificationsState();
}

class _QualificationsState extends State<Qualifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 9.0, left: 0),
          child: Text(
            "My Qualifications",
            maxLines: 2,
            style: TextStyle(
                fontSize: 15, color: primaryTheme, fontWeight: FontWeight.bold),
          ),
        ),
        Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: columnText("Qualification")),
                DataColumn(label: columnText("Our Related Academic Program")),
                DataColumn(label: columnText("Institution")),
                DataColumn(label: columnText("Date Creation")),
                DataColumn(label: columnText("Modification Date")),
              ],
              rows: [
                DataRow(cells: [
                  DataCell.empty,
                  DataCell.empty,
                  DataCell.empty,
                  DataCell.empty,
                  DataCell.empty,
                ]),
              ],
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
                  onPressed: () {},
                )),
          ),
        )
      ],
    ));
  }
}
