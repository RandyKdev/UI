import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

import '../nameConstants.dart';
import '../../models/qualificationDetails.dart';

Future<int> saveQualificationDetailsFunc(
    {QualificationDetails newQualification, Future<Database> database}) async {
  final db = await database;

  var res = await db.rawInsert('''
      INSERT INTO $qualificationDetailTable (
       $institution,
       $qualification,
       $endDate,
       $startDate,
       $relatedAcademicProgram
      ) VALUES (?, ?, ?, ?, ?)
     ''', [
    newQualification.institution,
    newQualification.qualification,
    newQualification.endDate,
    newQualification.startDate,
    newQualification.relatedAcademicProgram
  ]);

  return res;
}

Future<QualificationDetails> getQualificationDetailsFunc(
    {int qualificationDetailsId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $qualificationDetailTable WHERE $id = ?''',
    [qualificationDetailsId],
  );
  if (res.length > 0) {
    Map<String, dynamic> info = res.first;
    return QualificationDetails(
      id: info[id],
      endDate: info[endDate],
      startDate: info[startDate],
      qualification: info[qualification],
      institution: info[institution],
      relatedAcademicProgram: info[relatedAcademicProgram]
    );
  }
  return null;
}

Future<List<QualificationDetails>> getAllQualificationDetailsFunc(
    { Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $qualificationDetailTable''',
  );
  if (res.length > 0) {
    List<QualificationDetails> list;
    for (int i = 0; i < res.length; i++) {
      var now = res[i];
      list.add(
        QualificationDetails(
          id: now[id],
      endDate: now[endDate],
      startDate: now[startDate],
      qualification: now[qualification],
      institution: now[institution],
      relatedAcademicProgram: now[relatedAcademicProgram]
        ),
      );
    }
    return list;
  }
  return null;
}

Future<int> updateQualificationDetailsFunc(
    {QualificationDetails info, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawUpdate(
    '''UPDATE $qualificationDetailTable SET 
      $institution = ?,
      $qualification = ?,
      $endDate = ?,
      $startDate = ?,
      $relatedAcademicProgram = ?
      WHERE $id = ?
      ''',
    [
      info.institution,
      info.qualification,
      info.endDate,
      info.startDate,
      info.relatedAcademicProgram,
      info.id,
    ],
  );
  return res;
}

Future<int> deleteQualificationDetailsFunc(
    {int qualificationDetailsId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawDelete(
    '''
    DELETE FROM $qualificationDetailTable WHERE $id = ?
  ''',
    [qualificationDetailsId],
  );
  return res;
}
