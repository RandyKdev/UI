import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

import '../nameConstants.dart';
import '../../models/personalInformation.dart';

Future<int> savePersonalInformationFunc(
    {PersonalInformation newPersonal, Future<Database> database}) async {
  final db = await database;

  var res = await db.rawInsert('''
      INSERT INTO $personalInformationTable (
        $profileTitle,
      $firstName,
      $middleName,
      $lastName,
      $gender,
      $birthPlace,
      $dateOfBirth,
      $nationality,
      $bloodGroup,
      $motherTongue,
      $religion,
      $currentQualification
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
     ''', [
    newPersonal.profileTitle,
    newPersonal.firstName,
    newPersonal.middleName,
    newPersonal.lastName,
    newPersonal.gender,
    newPersonal.birthPlace,
    newPersonal.dateOfBirth,
    newPersonal.nationality,
    newPersonal.bloodGroup,
    newPersonal.motherTongue,
    newPersonal.religion,
    newPersonal.currentQualification
  ]);

  return res;
}

Future<PersonalInformation> getPersonalInformationFunc(
    {int personalInformationId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $personalInformationTable WHERE $id = ?''',
    [personalInformationId],
  );
  if (res.length > 0) {
    Map<String, dynamic> info = res.first;
    return PersonalInformation(
      id: info[id],
      profileTitle: info[profileTitle],
      firstName: info[firstName],
      middleName: info[middleName],
      lastName: info[lastName],
      dateOfBirth: info[dateOfBirth],
      birthPlace: info[birthPlace],
      gender: info[gender],
      motherTongue: info[motherTongue],
      bloodGroup: info[bloodGroup],
      nationality: info[nationality],
      religion: info[religion],
      currentQualification: info[currentQualification],
    );
  }
  return null;
}

Future<List<PersonalInformation>> getAllPersonalInformationFunc(
    { Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $personalInformationTable''',
  );
  if (res.length > 0) {
    List<PersonalInformation> list;
    for (int i = 0; i < res.length; i++) {
      var now = res[i];
      list.add(
        PersonalInformation(
          id: now[id],
          profileTitle: now[profileTitle],
          firstName: now[firstName],
          middleName: now[middleName],
          lastName: now[lastName],
          dateOfBirth: now[dateOfBirth],
          birthPlace: now[birthPlace],
          gender: now[gender],
          motherTongue: now[motherTongue],
          bloodGroup: now[bloodGroup],
          nationality: now[nationality],
          religion: now[religion],
          currentQualification: now[currentQualification],
        ),
      );
    }
    return list;
  }
  return null;
}

Future<int> updatePersonalInformationFunc(
    {
    PersonalInformation info,
    Future<Database> database}) async {
  final db = await database;
  var res = await db.rawUpdate(
    '''UPDATE $personalInformationTable SET 
    $profileTitle = ?,
      $firstName = ?,
      $middleName = ?,
      $lastName = ?,
      $gender = ?,
      $birthPlace = ?,
      $dateOfBirth = ?,
      $nationality = ?,
      $bloodGroup = ?,
      $motherTongue = ?,
      $religion = ?,
      $currentQualification = ?
      WHERE $id = ?
      ''',
    [
      info.profileTitle,
      info.firstName,
      info.middleName,
      info.lastName,
      info.gender,
      info.birthPlace,
      info.dateOfBirth,
      info.nationality,
      info.bloodGroup,
      info.motherTongue,
      info.religion,
      info.currentQualification,
      info.id
    ],
  );
  return res;
}

Future<int> deletePersonalInformationFunc(
    {int personalInformationId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawDelete(
    '''
    DELETE FROM $personalInformationTable WHERE $id = ?
  ''',
    [personalInformationId],
  );
  return res;
}
