import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user.dart';

Future<int> newUserFunc({User newUser, Future<Database> database}) async {
  final db = await database;

  var res = await db.rawInsert(
    '''
      INSERT INTO USERS (
        EMAIL, USERNAME, PASSWORD, ID
      ) VALUES (?, ?, ?, ?)
     ''',
    [newUser.email, newUser.username, newUser.password, newUser.id],
  );

  return res;
}

Future<User> getUserFunc({int userId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM USERS WHERE ID = ?''',
    [userId],
  );
  if (res.length > 0) {
    Map<String, dynamic> user = res.first;
    return User(
      email: user['EMAIL'],
      id: user['ID'],
      username: user['USERNAME'],
    );
  }
  return null;
}

Future<int> signInFunc({User user, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM USERS WHERE EMAIL = ? AND PASSWORD = ?''',
    [user.email, user.password],
  );
  if (res.length > 0) {
    return res.first['ID'];
  }
  return null;
}
