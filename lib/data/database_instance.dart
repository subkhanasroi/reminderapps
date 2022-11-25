import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/note_model.dart';

class DatabaseInstance {
  final _databaseName = 'reminder.db';
  final _databaseVersion = 1;

  //reminder table
  final String table = 'note';
  final String id = 'id';
  final String judul = 'judul';
  final String description = 'deskripsi';
  final String waktu = 'dateTime';
  final String interval = 'interval';
  final String createAt = 'create_at';
  final String updateAt = 'update_at';

  Database? _database;

  Future database() async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $table ($id INTEGER PRIMARY KEY, $judul TEXT NULL,$description TEXT NULL,$waktu TEXT NULL,$interval INTEGER NULL,$createAt TEXT NULL,$updateAt TEXT NULL)');
  }

  Future<List<NoteModel>> all() async {
    final data = await _database!.query(table);
    List<NoteModel> result = data.map((e) => NoteModel.fromJson(e)).toList();
    return result;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final query = _database!.insert(table, row);
    return query;
  }
}
