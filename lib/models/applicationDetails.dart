import 'package:flutter/material.dart';
import 'package:ui/database/dbprovider.dart';
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
    List<ApplicationDetails> applications = await DBProvider.db.getAllApplicationDetails();
     List<DataRow> rows;
     if(applications.length > 0) {
       for(int i = 0; i < applications.length; i++) {
         rows.add(
           DataRow(
          cells: [
          DataCell(Text(applications[i].id.toString()),),
          DataCell(Text(applications[i].programs),),
          DataCell(Text(applications[i].profile),),
          DataCell(Text(applications[i].startDate.toString()),),
          DataCell(Text(applications[i].endDate.toString()),),
          DataCell(Text(applications[i].studyMode),),
          DataCell(Text(applications[i].admissionType),),
          DataCell(Text('-'),),
          DataCell(Text('Submitted'),),
          DataCell(Text("None"),),
        ],
        ),
         );
       }
     return rows;
     }
      return null;
  }
}
