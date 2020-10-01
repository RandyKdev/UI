import 'package:flutter/material.dart';
import 'package:ui/database/dbprovider.dart';

import './utils/createTableHeadings.dart';
import './utils/table.dart';

class ContactDetails {
  String presentAddress,
      permanentAddress,
      country,
      stateOrRegion,
      city,
      personalEmail;
  int phone, mobile, id;
  
  ContactDetails({
    this.id,
    this.city,
    this.country,
    this.mobile,
    this.permanentAddress,
    this.personalEmail,
    this.phone,
    this.presentAddress,
    this.stateOrRegion,
  });

List<String> heads = [
      '#',
      'City',
      'State/Region',
      'Country',
      'Mobile',
      'Phone',
      'Present Address',
      'Permanent Address',
      'Personal Email',
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
    List<ContactDetails> contacts = await DBProvider.db.getAllContactDetails();
    List<DataRow> rows = [];
     if(contacts != null && contacts.length > 0) {
       for(int i = 0; i < contacts.length; i++) {
         rows.add(
           DataRow(
             selected: i % 2 == 0,
          cells: [
          DataCell(Text(contacts[i].id.toString()),),
          DataCell(Text(contacts[i].city),),
          DataCell(Text(contacts[i].stateOrRegion),),
          DataCell(Text(contacts[i].country),),
          DataCell(Text(contacts[i].mobile.toString()),),
          DataCell(Text(contacts[i].phone.toString()),),
          DataCell(Text(contacts[i].presentAddress),),
          DataCell(Text(contacts[i].permanentAddress),),
          DataCell(Text(contacts[i].personalEmail),),
        ],
        ),
         );
       }
     return rows;
     }
      return null;
  }
}
