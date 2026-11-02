import 'package:sqflite/sqflite.dart';

class SqfliteIntence {
  static const String database = 'database.db';

  Database? db;

  Future<Database> getInstance() async {
    if (db == null) {
      return await _inittialaze();
    }
    return db!;
  }

  Future<Database> _inittialaze() async {
    return await openDatabase(database);
  }

  Future<void> close() async {
    await db?.close();
  }

}
