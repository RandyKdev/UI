import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

import '../nameConstants.dart';
import '../../models/workDetails.dart';

Future<int> saveWorkDetailsFunc(
    {WorkDetails newWork, Future<Database> database}) async {
  final db = await database;

  var res = await db.rawInsert('''
      INSERT INTO $workDetailTable (
       $company,
       $program,
       $role,
       $workDescription,
       $endDate,
       $startDate
      ) VALUES (?, ?, ?, ?, ?, ?)
     ''', [
    newWork.company,
    newWork.program,
    newWork.role,
    newWork.workDescription,
    newWork.endDate,
    newWork.startDate,
  ]);

  return res;
}

Future<WorkDetails> getWorkDetailsFunc(
    {int workDetailsId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $workDetailTable WHERE $id = ?''',
    [workDetailsId],
  );
  if (res.length > 0) {
    Map<String, dynamic> info = res.first;
    return WorkDetails(
      id: info[id],
      company: info[company],
      role: info[role],
      endDate: info[endDate],
      startDate: info[startDate],
      workDescription: info[workDescription],
      program: info[program],
    );
  }
  return null;
}

Future<List<WorkDetails>> getAllWorkDetailsFunc(
    {Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $workDetailTable''',
  );
  if (res.length > 0) {
    List<WorkDetails> list;
    for (int i = 0; i < res.length; i++) {
      var now = res[i];
      list.add(
        WorkDetails(
          id: now[id],
      company: now[company],
      role: now[role],
      endDate: now[endDate],
      startDate: now[startDate],
      workDescription: now[workDescription],
      program: now[program],
        ),
      );
    }
    return list;
  }
  return null;
}

Future<int> updateWorkDetailsFunc(
    {WorkDetails info, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawUpdate(
    '''UPDATE $workDetailTable SET 
      $company = ?,
      $role = ?,
      $endDate = ?,
      $startDate = ?,
      $workDescription = ?,
      $program = ?
      WHERE $id = ?
      ''',
    [
      info.company,
      info.role,
      info.endDate,
      info.startDate,
      info.workDescription,
      info.program,
      info.id,
    ],
  );
  return res;
}

Future<int> deleteWorkDetailsFunc(
    {int workDetailsId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawDelete(
    '''
    DELETE FROM $workDetailTable WHERE $id = ?
  ''',
    [workDetailsId],
  );
  return res;
}
