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
    this.profileTitle,
    this.firstName,
    this.middleName,
    this.birthPlace,
    this.bloodGroup,
    this.currentQualification,
    this.dateOfBirth,
    this.gender,
    this.lastName,
    this.motherTongue,
    this.nationality,
    this.religion,
  });

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
    List<PersonalInformation> personals = await DBProvider.db.getAllPersonalInformation();
    List<DataRow> rows = [];
     if(personals != null && personals.length > 0) {
       for(int i = 0; i < personals.length; i++) {
         rows.add(
           DataRow(
             selected: i % 2 == 0,
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
