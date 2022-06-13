import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:notesapp/models/note_model.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  static Database? _database;

  // creating the getter the database
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), "notesapp.db"),
        onCreate: (db, version) async {
      await db.execute('''
  CREATE TABLE notes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    creationDate DATE,
    pinned BOOLEAN NOT NULL,
    color TEXT NOT NULL
  )
''');
    }, version: 1);
  }

  addNewNote(NoteModel note) async {
    final db = await database;
    db.insert("notes", note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<dynamic> getNotes() async {
    final db = await database;
    var res = await db.query("notes");
    if (res.isEmpty) {
      return Null;
    } else {
      var resultMap = res.toList();
      return resultMap.isNotEmpty ? resultMap : Null;
    }
  }
}
