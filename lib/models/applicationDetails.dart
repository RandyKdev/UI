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
    this.endDate,
    this.startDate,
    this.admissionType,
    this.campus,
    this.profile,
    this.programs,
    this.studyMode,
  });


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

 List<DataRow> makeEmptyRow() {
   List<DataCell> emptyCells = [];
   for(int i = 0; i < heads.length; i++) {
     emptyCells.add(
       DataCell(Text(''))
     );
   }
   return [DataRow(cells: emptyCells)];
 }

  Future<ModelTable> getTable() async {
    List<DataRow> rows = await _getTableBody();
    if(rows == null) rows = makeEmptyRow();
    List<DataColumn> columns = _getTableHeadings();
    return ModelTable(columns: columns, rows: rows);
  }
  List<DataColumn> _getTableHeadings() => createTableHeadings(heads);

  Future<List<DataRow>> _getTableBody() async {
    List<ApplicationDetails> applications = await DBProvider.db.getAllApplicationDetails();
     List<DataRow> rows = [];
     if(applications != null && applications.length > 0) {
       for(int i = 0; i < applications.length; i++) {
         rows.add(
           DataRow(
             selected: i % 2 == 0,
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
