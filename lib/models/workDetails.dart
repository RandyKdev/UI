import 'package:flutter/material.dart';

import './utils/table.dart';
import './utils/createTableHeadings.dart';

class WorkDetails {
  String company, role, workDescription, program;
  DateTime startDate, endDate;

  WorkDetails({
    @required this.company,
    @required this.endDate,
    @required this.program,
    @required this.startDate,
    @required this.role,
    @required this.workDescription,
  });

   
  Future<ModelTable> getTable() async {
    List<DataRow> rows = await _getTableBody();
    List<DataColumn> columns = _getTableHeadings();
    return ModelTable(columns: columns, rows: rows);
  }

  List<DataColumn> _getTableHeadings() {
    List<String> heads = [
      '#',
      'Company',
      'Role',
      'From',
      'To',
      'Related Academic Program',
    ];
    return createTableHeadings(heads);
  }

  Future<List<DataRow>> _getTableBody() async {
    //access database
    //  return [
    //     DataRow(
    //       cells: [
    //       DataCell(Text('1'),),
    //     ],
    //     ),
      // ];
      return [DataRow()];
  }
}
