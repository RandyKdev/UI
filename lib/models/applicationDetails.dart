import 'package:flutter/material.dart';
import 'package:ui/models/utils/table.dart';

import './utils/createTableHeadings.dart';

class ApplicationDetails {
  String campus, programs, profile, studyMode, admissionType;
  DateTime startDate, endDate;
int id;

  ApplicationDetails({
    this.id,
    @required this.endDate,
    @required this.startDate,
    @required this.admissionType,
    @required this.campus,
    @required this.profile,
    @required this.programs,
    @required this.studyMode,
  });

  Future<ModelTable> getTable() async {
    List<DataRow> rows = await _getTableBody();
    List<DataColumn> columns = _getTableHeadings();
    return ModelTable(columns: columns, rows: rows);
  }

  List<DataColumn> _getTableHeadings() {
    List<String> heads = [
      '#',
      'Programs',
      'Profile Name',
      'Expected Start Date',
      'Expected Finish Date',
      'Study Mode',
      'Admission Type',
      'Current Level (Top up and Transfer cases)',
      'Applicaiton Status',
      'Comments'
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
