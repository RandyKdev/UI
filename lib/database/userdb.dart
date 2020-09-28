
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user.dart';

newUserFunc({User newUser, Future<Database> database}) async {
    final db = await database;

    var res = await db.rawInsert(''' 
      INSERT INTO users (
        email, username, password
      ) VALUES (?, ?, ?)
     ''',
      [newUser.email, newUser.username, newUser.password],
    );

    return res;
  }


  Future<dynamic> getUserFunc({User userId, Future<Database> database }) async {
    final db = await database;
    var res = await db.query('users', where: 'id = $userId');
    return res[0];
  }