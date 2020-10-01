import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/user.dart';
import '../nameConstants.dart';

Future<int> newUserFunc({User newUser, Future<Database> database}) async {
  final db = await database;

  var res = await db.rawInsert(
    '''
      INSERT INTO $userTable (
        $email, $username, $password, $id
      ) VALUES (?, ?, ?, ?)
     ''',
    [newUser.email, newUser.username, newUser.password, newUser.id],
  );

  return res;
}

Future<User> getUserFunc({int userId, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $userTable WHERE $id = ?''',
    [userId],
  );
  if (res.length > 0) {
    Map<String, dynamic> user = res.first;
    return User(
      email: user[email],
      id: user[id],
      username: user[username],
    );
  }
  return null;
}

Future<int> signInFunc({User user, Future<Database> database}) async {
  final db = await database;
  var res = await db.rawQuery(
    '''SELECT * FROM $userTable WHERE $email = ? AND $password = ?''',
    [user.email, user.password],
  );
  if (res.length > 0) {
    return res.first[id];
  }
  return null;
}
