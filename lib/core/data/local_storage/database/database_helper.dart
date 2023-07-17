import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Future<Database> initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'rick_and_morty.db');

    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''CREATE TABLE IF NOT EXISTS 
                        character (id INTEGER PRIMARY KEY, name TEXT, status TEXT, species TEXT, type TEXT, gender TEXT,
                          origin TEXT, location TEXT, image TEXT, favorite INTEGER )''');
      },
    );
    return database;
  }
}
