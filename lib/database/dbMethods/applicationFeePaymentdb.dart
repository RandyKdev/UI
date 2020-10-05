import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

import '../nameConstants.dart';
import '../../models/applicationFeePayment.dart';

Future<int> saveApplicationFeePaymentFunc(
    {ApplicationFeePayment newDocument, Future<Database> database}) async {
  final db = await database;

  var res = await db.rawInsert('''
      INSERT INTO $applicationFeePaymentTable (
       $amount,
       $momoNumber,
       $referenceNumber,
       $bankReceipt
      ) VALUES (?, ?, ?, ?)
     ''', [
    newDocument.amount,
    newDocument.momoNumber,
    newDocument.referenceNumber,
    newDocument.bankReceipt,
  ]);

  return res;
}

Future<ApplicationFeePayment> getApplicationFeePaymentFunc(
    {int applicationFeePaymentId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $applicationFeePaymentTable WHERE $id = ?''',
    [applicationFeePaymentId],
  );
  if (res.length > 0) {
    Map<String, dynamic> info = res.first;
    return ApplicationFeePayment(
      id: info[id],
      bankReceipt: info[bankReceipt],
      amount: info[amount],
      referenceNumber: info[referenceNumber],
      momoNumber: info[momoNumber],

    );
  }
  return null;
}

Future<List<ApplicationFeePayment>> getAllApplicationFeePaymentFunc(
    {Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $applicationFeePaymentTable''',
  );
  if (res.length > 0) {
    List<ApplicationFeePayment> list;
    for (int i = 0; i < res.length; i++) {
      var now = res[i];
      list.add(
        ApplicationFeePayment(
          id: now[id],
          bankReceipt: now[bankReceipt],
          amount: now[amount],
          momoNumber: now[momoNumber],
          referenceNumber: now[referenceNumber],
        ),
      );
    }
    return list;
  }
  return null;
}

Future<int> updateApplicationFeePaymentFunc(
    {ApplicationFeePayment info, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawUpdate(
    '''UPDATE $applicationFeePaymentTable SET 
      $bankReceipt = ?,
       $amount = ?,
       $momoNumber = ?,
       $referenceNumber = ?
      WHERE $id = ?
      ''',
    [
      info.bankReceipt,
      info.amount,
      info.momoNumber,
      info.referenceNumber,
      info.id,
    ],
  );
  return res;
}

Future<int> deleteApplicationFeePaymentFunc(
    {int applicationFeePaymentId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawDelete(
    '''
    DELETE FROM $applicationFeePaymentTable WHERE $id = ?
  ''',
    [applicationFeePaymentId],
  );
  return res;
}
