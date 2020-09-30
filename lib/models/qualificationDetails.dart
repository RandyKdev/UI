import 'package:flutter/material.dart';

import './utils/createTableHeadings.dart';
import './utils/table.dart';

class QualificationDetails {
  String institution, qualification, relatedAcademicProgram;
  DateTime startDate, endDate;
  int id;

  QualificationDetails({
    this.id,
    @required this.startDate,
    @required this.endDate,
    @required this.institution,
    @required this.qualification,
    @required this.relatedAcademicProgram,
  });

   
  Future<ModelTable> getTable() async {
    List<DataRow> rows = await _getTableBody();
    List<DataColumn> columns = _getTableHeadings();
    return ModelTable(columns: columns, rows: rows);
  }

  List<DataColumn> _getTableHeadings() {
    List<String> heads = [
      '#',
      'Qualification',
      'Institution',
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
