import 'package:flutter/material.dart';

import '../../../colorConstants.dart';
import 'customText.dart';

class CreateApplication extends StatefulWidget {
  @override
  _CreateApplicationState createState() => _CreateApplicationState();
}

class _CreateApplicationState extends State<CreateApplication> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 9.0, left: 0),
          child: pageHeader("Create Application"),
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
