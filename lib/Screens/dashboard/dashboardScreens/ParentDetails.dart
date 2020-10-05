import 'package:flutter/material.dart';

import '../../../colorConstants.dart';
import 'customText.dart';

class ParentDetails extends StatefulWidget {
  @override
  _ParentDetailsState createState() => _ParentDetailsState();
}

class _ParentDetailsState extends State<ParentDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 9.0),
            child: Center(child: pageHeader("Parent Details")),
          ),
          Divider(),
          Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: columnText("Full Names")),
                  DataColumn(label: columnText("Relation")),
                  DataColumn(label: columnText("Occupation")),
                  DataColumn(label: columnText("Address")),
                  DataColumn(label: columnText("Nationality")),
                  DataColumn(label: columnText("phone")),
                  DataColumn(label: columnText("Email")),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell.empty,
                    DataCell.empty,
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/parentDetails');
                    },
                  )),
            ),
          )
        ],
      ),
    );
  }
}
