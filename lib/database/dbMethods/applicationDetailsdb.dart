import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

import '../nameConstants.dart';
import '../../models/applicationDetails.dart';

Future<int> saveApplicationDetailsFunc(
    {ApplicationDetails newApplication, Future<Database> database}) async {
  final db = await database;

  var res = await db.rawInsert('''
      INSERT INTO $applicationDetailTable (
       $endDate,
       $startDate,
       $admissionType,
       $campus,
       $profile,
       $program,
$studyMode
      ) VALUES (?, ?, ?, ?, ?, ?, ?)
     ''', [
    newApplication.endDate,
    newApplication.startDate,
    newApplication.admissionType,
    newApplication.campus,
    newApplication.profile,
    newApplication.programs,
newApplication.studyMode,
  ]);

  return res;
}

Future<ApplicationDetails> getApplicationDetailsFunc(
    {int applicationDetailsId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $applicationDetailTable WHERE $id = ?''',
    [applicationDetailsId],
  );
  if (res.length > 0) {
    Map<String, dynamic> info = res.first;
    return ApplicationDetails(
      id: info[id],
      endDate: info[endDate],
      startDate: info[startDate],
      programs: info[program],
      admissionType: info[admissionType],
      campus: info[campus],
      profile: info[profile],
      studyMode: info[studyMode],
    );
  }
  return null;
}

Future<List<ApplicationDetails>> getAllApplicationDetailsFunc(
    {Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $applicationDetailTable''',
  );
  if (res.length > 0) {
    List<ApplicationDetails> list;
    for (int i = 0; i < res.length; i++) {
      var now = res[i];
      list.add(
        ApplicationDetails(
          id: now[id],
      endDate: now[endDate],
      startDate: now[startDate],
      programs: now[program],
      admissionType: now[admissionType],
      campus: now[campus],
      profile: now[profile],
      studyMode: now[studyMode],
        ),
      );
    }
    return list;
  }
  return null;
}

Future<int> updateApplicationDetailsFunc(
    {ApplicationDetails info, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawUpdate(
    '''UPDATE $applicationDetailTable SET 
      $endDate = ?,
       $startDate = ?,
       $admissionType = ?,
       $campus = ?,
       $profile = ?,
       $program = ?,
$studyMode = ?
      WHERE $id = ?
      ''',
    [
      info.endDate,
      info.startDate,
      info.admissionType,
      info.campus,
      info.profile,
      info.programs,
      info.studyMode,
      info.id,
    ],
  );
  return res;
}

Future<int> deleteApplicationDetailsFunc(
    {int applicationDetailsId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawDelete(
    '''
    DELETE FROM $applicationDetailTable WHERE $id = ?
  ''',
    [applicationDetailsId],
  );
  return res;
}
