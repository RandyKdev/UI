import 'package:flutter/material.dart';
import 'package:ui/colorConstants.dart';

class Tables extends StatelessWidget {
  // Tables({column})
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
      ],
      rows: [
        DataRow(
          cells: [
          DataCell(Text('1'),),
          DataCell(Text('Randy'),),
          DataCell(Text('1'),),
          DataCell(Text('Randy'),),
          DataCell(Text('1'),),
          DataCell(Text('Randy'),),
          DataCell(Text('1'),),
          DataCell(Text('Randy'),),
        ],),
      ],
    );
  }  
}