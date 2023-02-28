import 'dart:developer';

import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      full_name TEXT,
      email Text,
      password Text,
      pin Text,
      createdAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
  }

  static Future<sql.Database> openDatabase() async {
    return sql.openDatabase('advancio.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      log('.....creating a user');
      await createTable(database);
    });
  }

  static Future<int> createUser({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final db = await SQLHelper.openDatabase();

    final data = {
      'full_name': fullName,
      'email': email,
      'password': password,
    };

    final id = await db.insert(
      'users',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<int> updateUser({
    required String pin,
    required int id,
  }) async {
    final db = await SQLHelper.openDatabase();

    final data = {
      'pin': pin,
    };

    final result =
        await db.update('users', data, where: "id = ?", whereArgs: [id]);
    return result;
  }
}
