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
    @required this.stateOrRegion,
    @required this.phone,
    @required this.mobile,
    @required this.city,
    @required this.nationality,
    @required this.address,
    @required this.education,
    @required this.email,
    @required this.fullNames,
    @required this.occupation,
    @required this.relation,
  });

   
  Future<ModelTable> getTable() async {
    List<DataRow> rows = await _getTableBody();
    List<DataColumn> columns = _getTableHeadings();
    return ModelTable(columns: columns, rows: rows);
  }

  List<DataColumn> _getTableHeadings() {
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
    return createTableHeadings(heads);
  }

  Future<List<DataRow>> _getTableBody() async {
    List<ParentDetails> parents = await DBProvider.db.getAllParentDetails();
    List<DataRow> rows;
     if(parents.length > 0) {
       for(int i = 0; i < parents.length; i++) {
         rows.add(
           DataRow(
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
