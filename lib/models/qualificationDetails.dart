import 'package:flutter/material.dart';
import 'package:ui/database/dbprovider.dart';

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
   List<QualificationDetails> qualifications = await DBProvider.db.getAllQualificationDetails();
   List<DataRow> rows;
     if(qualifications.length > 0) {
       for(int i = 0; i < qualifications.length; i++) {
         rows.add(
           DataRow(
          cells: [
          DataCell(Text(qualifications[i].id.toString()),),
          DataCell(Text(qualifications[i].qualification),),
          DataCell(Text(qualifications[i].institution),),
          DataCell(Text(qualifications[i].startDate.toString()),),
          DataCell(Text(qualifications[i].endDate.toString()),),
          DataCell(Text(qualifications[i].relatedAcademicProgram),),
        ],
        ),
         );
       }
     return rows;
     }
      return null;
  }
}
