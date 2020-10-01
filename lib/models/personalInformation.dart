import 'package:flutter/material.dart';
import 'package:ui/database/dbprovider.dart';

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
int id;

  PersonalInformation({
    this.id,
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
    List<PersonalInformation> personals = await DBProvider.db.getAllPersonalInformation();
    List<DataRow> rows;
     if(personals.length > 0) {
       for(int i = 0; i < personals.length; i++) {
         rows.add(
           DataRow(
          cells: [
          DataCell(Text(personals[i].id.toString()),),
          DataCell(Text(personals[i].profileTitle),),
          DataCell(Text(personals[i].firstName),),
          DataCell(Text(personals[i].middleName),),
          DataCell(Text(personals[i].lastName),),
          DataCell(Text(personals[i].gender),),
          DataCell(Text(personals[i].nationality),),
          DataCell(Text(personals[i].birthPlace),),
          DataCell(Text(personals[i].dateOfBirth.toString()),),
          DataCell(Text(personals[i].religion),),
          DataCell(Text(personals[i].motherTongue),),
          DataCell(Text(personals[i].bloodGroup),),
          DataCell(Text(personals[i].currentQualification),),
        ],
        ),
         );
       }
     return rows;
     }
      return null;
  }
}
