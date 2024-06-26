// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:dsp_app/db/note.dart';
//
// class NotesDatabase {
//   static final NotesDatabase instance = NotesDatabase._init();
//
//   static Database? _database;
//
//   NotesDatabase._init();
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//
//     _database = await _initDB('notes.db');
//     return _database!;
//   }
//
//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);
//
//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }
//
//   Future _createDB(Database db, int version) async {
//     final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
//     final textType = 'TEXT NOT NULL';
//     final boolType = 'BOOLEAN NOT NULL';
//     final integerType = 'INTEGER NOT NULL';
//
//     await db.execute('''
// CREATE TABLE $tableNotes (
//   ${NoteFields.id} $idType,
//   ${NoteFields.testId} $integerType,
//   ${NoteFields.testName} $textType,
//   ${NoteFields.parameterCovered} $textType,
//   ${NoteFields.specialPreparation} $textType,
//   ${NoteFields.sampleRequired} $textType,
//   ${NoteFields.price} $textType,
//   ${NoteFields.createdtime} $textType
//
//   )
// ''');
//   }
//
//   Future<Note> create(Note note) async {
//     final db = await instance.database;
//
//     // final json = note.toJson();
//     // final columns =
//     //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
//     // final values =
//     //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
//     // final id = await db
//     //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');
//
//     final id = await db.insert(tableNotes, note.toJson());
//     return note.copy(id: id);
//   }
//
//   Future<List<Note>> readNote(int testName) async {
//     final db = await instance.database;
//
//     final maps = await db.query(
//       tableNotes,
//       columns: NoteFields.values,
//       where: '${NoteFields.testId} = ?',
//       whereArgs: [testName],
//     );
//
//     if (maps.isNotEmpty) {
//       return maps.map((json) => Note.fromJson(json)).toList();
//     } else {
//       return [];
//     }
//   }
//
//   Future<List<Note>> readAllNotes() async {
//     final db = await instance.database;
//
//     final orderBy = '${NoteFields.createdtime} ASC';
//     // final result =
//     //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');
//
//     final result = await db.query(tableNotes, orderBy: orderBy);
//
//     return result.map((json) => Note.fromJson(json)).toList();
//   }
//
//   Future<int> update(Note note) async {
//     final db = await instance.database;
//
//     return db.update(
//       tableNotes,
//       note.toJson(),
//       where: '${NoteFields.id} = ?',
//       whereArgs: [note.id],
//     );
//   }
//
//   Future<int> delete(int id) async {
//     final db = await instance.database;
//
//     return await db.delete(
//       tableNotes,
//       where: '${NoteFields.id} = ?',
//       whereArgs: [id],
//     );
//   }
//
//   Future close() async {
//     final db = await instance.database;
//
//     db.close();
//   }
// }
//
