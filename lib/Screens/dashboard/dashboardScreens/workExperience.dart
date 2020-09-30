import 'package:flutter/material.dart';
import 'package:ui/screens/dashboard/dashboardScreens/customText.dart';

import '../../../colorConstants.dart';

class WorkExperience extends StatefulWidget {
  @override
  _WorkExperienceState createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 9.0),
            child: Center(child: pageHeader("My Work Experiences")),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: columnText("Company")),
                  DataColumn(label: columnText("Role")),
                  DataColumn(label: columnText("Date from")),
                  DataColumn(label: columnText("Date to")),
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
      ),
    );
  }
}
