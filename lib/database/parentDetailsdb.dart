import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

import './nameConstants.dart';
import '../models/parentDetails.dart';

Future<int> saveParentDetailsFunc(
    {ParentDetails newParent, Future<Database> database}) async {
  final db = await database;

  var res = await db.rawInsert('''
      INSERT INTO $parentDetailTable (
        $fullNames,
        $relation,
        $education,
        $occupation,
  $address,
  $nationality,
  $stateOrRegion,
  $city,
  $email,
  $mobile,
  $phone
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
     ''', [
    newParent.fullNames,
    newParent.relation,
    newParent.education,
    newParent.occupation,
    newParent.address,
    newParent.nationality,
    newParent.stateOrRegion,
    newParent.city,
    newParent.email,
    newParent.mobile,
    newParent.phone
  ]);

  return res;
}

Future<ParentDetails> getParentDetailsFunc(
    {int parentDetailsId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $parentDetailTable WHERE $id = ?''',
    [parentDetailsId],
  );
  if (res.length > 0) {
    Map<String, dynamic> info = res.first;
    return ParentDetails(
      id: info[id],
      stateOrRegion: info[stateOrRegion],
      phone: info[phone],
      mobile: info[mobile],
      city: info[city],
      nationality: info[nationality],
      fullNames: info[fullNames],
      email: info[email],
      education: info[education],
      relation: info[relation],
      occupation: info[occupation],
      address: info[address],
    );
  }
  return null;
}

Future<List<ParentDetails>> getAllparentDetailsFunc(
    {ParentDetails info, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $parentDetailTable''',
  );
  if (res.length > 0) {
    List<ParentDetails> list;
    for (int i = 0; i < res.length; i++) {
      var now = res[i];
      list.add(
        ParentDetails(
          id: now[id],
          stateOrRegion: now[stateOrRegion],
          phone: now[phone],
          mobile: now[mobile],
          city: now[city],
          nationality: now[nationality],
          fullNames: now[fullNames],
          email: now[email],
          education: now[education],
          relation: now[relation],
          occupation: now[occupation],
          address: now[address],
        ),
      );
    }
    return list;
  }
  return null;
}

Future<int> updateparentDetailsFunc(
    {ParentDetails info, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawUpdate(
    '''UPDATE $parentDetailTable SET 
    $fullNames = ?,
        $relation = ?,
        $education = ?,
        $occupation = ?,
  $address = ?,
  $nationality = ?,
  $stateOrRegion = ?,
  $city = ?,
  $email = ?,
  $mobile = ?,
  $phone = ?
      WHERE $id = ?
      ''',
    [
      info.fullNames,
      info.relation,
      info.education,
      info.occupation,
      info.address,
      info.nationality,
      info.stateOrRegion,
      info.city,
      info.email,
      info.mobile,
      info.phone,
      info.id
    ],
  );
  return res;
}

Future<int> deleteParentDetailsFunc(
    {int parentDetailsId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawDelete(
    '''
    DELETE FROM $parentDetailTable WHERE $id = ?
  ''',
    [parentDetailsId],
  );
  return res;
}
