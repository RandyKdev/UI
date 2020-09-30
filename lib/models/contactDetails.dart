import 'package:flutter/material.dart';

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
