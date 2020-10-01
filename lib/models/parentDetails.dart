import 'package:flutter/material.dart';
import 'package:ui/database/dbprovider.dart';

import './utils/table.dart';
import './utils/createTableHeadings.dart';

class ParentDetails {
  String fullNames,
      relation,
      education,
      occupation,
      address,
      nationality,
      stateOrRegion,
      city,
      email;
  int phone, mobile, id;
  
  ParentDetails({
    this.id,
    this.stateOrRegion,
    this.phone,
    this.mobile,
    this.city,
    this.nationality,
    this.address,
    this.education,
    this.email,
    this.fullNames,
    this.occupation,
    this.relation,
  });

    List<String> heads = [
      '#',
      'Full Names',
      'Relation',
      'Occupation',
      'Address',
      'Nationality',
      'Phone',
      'Mobile',
      'Email',
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
    List<ParentDetails> parents = await DBProvider.db.getAllParentDetails();
    List<DataRow> rows = [];
     if(parents != null && parents.length > 0) {
       for(int i = 0; i < parents.length; i++) {
         rows.add(
           DataRow(
             selected: i % 2 == 0,
          cells: [
          DataCell(Text(parents[i].id.toString()),),
          DataCell(Text(parents[i].fullNames),),
          DataCell(Text(parents[i].relation),),
          DataCell(Text(parents[i].occupation),),
          DataCell(Text(parents[i].address),),
          DataCell(Text(parents[i].nationality),),
          DataCell(Text(parents[i].phone.toString()),),
          DataCell(Text(parents[i].mobile.toString()),),
          DataCell(Text(parents[i].email),),
        ],
        ),
         );
       }
     return rows;
     }
      return null;
  }
}
