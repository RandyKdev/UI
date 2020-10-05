import 'package:flutter/material.dart';
import 'package:ui/database/dbprovider.dart';

import './utils/table.dart';
import './utils/createTableHeadings.dart';

class WorkDetails {
  String company, role, workDescription, program;
  DateTime startDate, endDate;
  int id;

  WorkDetails({
    this.id,
    this.company,
    this.endDate,
    this.program,
    this.startDate,
    this.role,
    this.workDescription,
  });

    List<String> heads = [
      '#',
      'Company',
      'Role',
      'From',
      'To',
      'Related Academic Program',
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
    List<WorkDetails> works = await DBProvider.db.getAllWorkDetails();
    List<DataRow> rows = [];
     if(works != null && works.length > 0) {
       for(int i = 0; i < works.length; i++) {
         rows.add(
           DataRow(
             selected: i % 2 == 0,
          cells: [
          DataCell(Text(works[i].id.toString()),),
          DataCell(Text(works[i].company),),
          DataCell(Text(works[i].role),),
          DataCell(Text(works[i].startDate.toString()),),
          DataCell(Text(works[i].endDate.toString()),),
          DataCell(Text(works[i].program),),
        ],
        ),
         );
       }
     return rows;
     }
      return null;
  }
}
