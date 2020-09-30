import 'package:flutter/material.dart';

import './utils/createTableHeadings.dart';
import './utils/table.dart';

class DocumentDetails {
  String documentTitle, relatedAcademicProgram;
  dynamic document;

  DocumentDetails({
    @required this.relatedAcademicProgram,
    @required this.document,
    @required this.documentTitle,
  });

  
  Future<ModelTable> getTable() async {
    List<DataRow> rows = await _getTableBody();
    List<DataColumn> columns = _getTableHeadings();
    return ModelTable(columns: columns, rows: rows);
  }

  List<DataColumn> _getTableHeadings() {
    List<String> heads = [
      '#',
      'Document Title',
      'File',
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
