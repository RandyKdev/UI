import 'package:flutter/material.dart';

import '../../../colorConstants.dart';
import 'customText.dart';

class Documents extends StatefulWidget {
  @override
  _DocumentsState createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 9.0),
            child: Center(child: pageHeader("My Documents")),
          ),
          Divider(),
          Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: columnText("Document Title")),
                  DataColumn(label: columnText("Document Extension")),
                  DataColumn(label: columnText("creation Date")),
                  DataColumn(label: columnText("Date Modified")),
                  DataColumn(label: columnText("Related Academic Program")),
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
      ),
    );
  }
}
