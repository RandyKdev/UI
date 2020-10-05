import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

import '../nameConstants.dart';
import '../../models/documentDetails.dart';

Future<int> saveDocumentDetailsFunc(
    {DocumentDetails newDocument, Future<Database> database}) async {
  final db = await database;

  var res = await db.rawInsert('''
      INSERT INTO $documentDetailTable (
       $document,
       $documentTitle,
       $relatedAcademicProgram,
      ) VALUES (?, ?, ?)
     ''', [
    newDocument.document,
    newDocument.documentTitle,
    newDocument.relatedAcademicProgram,
  ]);

  return res;
}

Future<DocumentDetails> getDocumentDetailsFunc(
    {int documentDetailsId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $documentDetailTable WHERE $id = ?''',
    [documentDetailsId],
  );
  if (res.length > 0) {
    Map<String, dynamic> info = res.first;
    return DocumentDetails(
      id: info[id],
      document: info[document],
      documentTitle: info[documentTitle],
      relatedAcademicProgram: info[relatedAcademicProgram],
    );
  }
  return null;
}

Future<List<DocumentDetails>> getAllDocumentDetailsFunc(
    {Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $documentDetailTable''',
  );
  if (res.length > 0) {
    List<DocumentDetails> list;
    for (int i = 0; i < res.length; i++) {
      var now = res[i];
      list.add(
        DocumentDetails(
          id: now[id],
      documentTitle: now[documentTitle],
      document: now[document],
      relatedAcademicProgram: now[relatedAcademicProgram],
        ),
      );
    }
    return list;
  }
  return null;
}

Future<int> updateDocumentDetailsFunc(
    {DocumentDetails info, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawUpdate(
    '''UPDATE $documentDetailTable SET 
      $document = ?,
       $documentTitle = ?,
       $relatedAcademicProgram = ?,
      WHERE $id = ?
      ''',
    [
      info.document,
      info.documentTitle,
      info.relatedAcademicProgram,
      info.id,
    ],
  );
  return res;
}

Future<int> deleteDocumentDetailsFunc(
    {int documentDetailsId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawDelete(
    '''
    DELETE FROM $documentDetailTable WHERE $id = ?
  ''',
    [documentDetailsId],
  );
  return res;
}
