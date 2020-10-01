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
    @required this.city,
    @required this.country,
    @required this.mobile,
    @required this.permanentAddress,
    @required this.personalEmail,
    @required this.phone,
    @required this.presentAddress,
    @required this.stateOrRegion,
  });

  Future<ModelTable> getTable() async {
    List<DataRow> rows = await _getTableBody();
    List<DataColumn> columns = _getTableHeadings();
    return ModelTable(columns: columns, rows: rows);
  }

  List<DataColumn> _getTableHeadings() {
    List<String> heads = [
      '#',
      'City',
      'State or Region'
      'Country',
      'Mobile',
      'Phone',
      'Present Address'
      'Permanent Address',
      'Personal Email',
    ];
    return createTableHeadings(heads);
  }

  Future<List<DataRow>> _getTableBody() async {
    List<ContactDetails> contacts = await DBProvider.db.getAllContactDetails();
    List<DataRow> rows;
     if(contacts.length > 0) {
       for(int i = 0; i < contacts.length; i++) {
         rows.add(
           DataRow(
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
