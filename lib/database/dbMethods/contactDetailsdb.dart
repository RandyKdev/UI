import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

import '../nameConstants.dart';
import '../../models/contactDetails.dart';

Future<int> saveContactDetailsFunc(
    {ContactDetails newContact, Future<Database> database}) async {
  final db = await database;

  var res = await db.rawInsert('''
      INSERT INTO $contactDetailTable (
       $city,
       $stateOrRegion,
       $country,
       $presentAddress,
       $permanentAddress,
       $email,
       $phone,
       $mobile
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
     ''', [
    newContact.city,
    newContact.stateOrRegion,
    newContact.country,
    newContact.presentAddress,
    newContact.permanentAddress,
    newContact.personalEmail,
    newContact.phone,
    newContact.mobile,
  ]);

  return res;
}

Future<ContactDetails> getContactDetailsFunc(
    {int contactDetailsId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $contactDetailTable WHERE $id = ?''',
    [contactDetailsId],
  );
  if (res.length > 0) {
    Map<String, dynamic> info = res.first;
    return ContactDetails(
      id: info[id],
      phone: info[phone],
      mobile: info[mobile],
      presentAddress: info[presentAddress],
      permanentAddress: info[permanentAddress],
      personalEmail: info[email],
stateOrRegion: info[stateOrRegion],
city: info[city],
country: info[country],
    );
  }
  return null;
}

Future<List<ContactDetails>> getAllContactDetailsFunc(
    {Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $contactDetailTable''',
  );
  if (res.length > 0) {
    List<ContactDetails> list;
    for (int i = 0; i < res.length; i++) {
      var now = res[i];
      list.add(
        ContactDetails(
          id: now[id],
      city: now[city],
      stateOrRegion: now[stateOrRegion],
      country: now[country],
      presentAddress: now[presentAddress],
      permanentAddress: now[permanentAddress],
      phone: now[phone],
      mobile: now[mobile],
      personalEmail: now[email],
        ),
      );
    }
    return list;
  }
  return null;
}

Future<int> updateContactDetailsFunc(
    {ContactDetails info, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawUpdate(
    '''UPDATE $contactDetailTable SET 
      $city = ?,
       $stateOrRegion = ?,
       $country = ?,
       $presentAddress = ?,
       $permanentAddress = ?,
       $email = ?,
       $phone = ?,
       $mobile = ?
      WHERE $id = ?
      ''',
    [
      info.city,
      info.stateOrRegion,
      info.country,
      info.presentAddress,
      info.permanentAddress,
      info.personalEmail,
      info.phone,
      info.mobile,
      info.id,
    ],
  );
  return res;
}

Future<int> deleteContactDetailsFunc(
    {int contactDetailsId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawDelete(
    '''
    DELETE FROM $contactDetailTable WHERE $id = ?
  ''',
    [contactDetailsId],
  );
  return res;
}
