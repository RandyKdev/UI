import 'package:flutter/material.dart';

import './utils/table.dart';
import './utils/createTableHeadings.dart';

class PersonalInformation {
  String profileTitle,
      firstName,
      middleName,
      lastName,
      gender,
      birthPlace,
      nationality,
      bloodGroup,
      motherTongue,
      religion,
      currentQualification;
  DateTime dateOfBirth;

  PersonalInformation({
    @required this.profileTitle,
    @required this.firstName,
    @required this.middleName,
    @required this.birthPlace,
    @required this.bloodGroup,
    @required this.currentQualification,
    @required this.dateOfBirth,
    @required this.gender,
    @required this.lastName,
    @required this.motherTongue,
    @required this.nationality,
    @required this.religion,
  });

   
  Future<ModelTable> getTable() async {
    List<DataRow> rows = await _getTableBody();
    List<DataColumn> columns = _getTableHeadings();
    return ModelTable(columns: columns, rows: rows);
  }

  List<DataColumn> _getTableHeadings() {
    List<String> heads = [
      '#',
      'Profile Title',
      'First Name',
      'Middle Name',
      'Last Name',
      'Gender',
      'Nationality',
      'Birth Place',
      'Date of Birth',
      'Religion',
      'Mother Tongue',
      'Blood Group',
      'Current Qualification',
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
