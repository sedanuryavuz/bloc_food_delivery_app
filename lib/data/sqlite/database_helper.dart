import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();


  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('food_delivery.sqlite');
    return _database!;
  }
  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    if (await databaseExists(path)) {
      await deleteDatabase(path);
      print('Önceki veritabanı silindi.');
    }

    await Directory(dirname(path)).create(recursive: true);
    final data = await rootBundle.load('db/$fileName');
    final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes, flush: true);
    print('Veritabanı kopyalandı: $path');

    return await openDatabase(path);
  }






  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await instance.database;
    return await db.insert('users', user);
  }

  Future<bool> checkUserExists(String email) async {
    final db = await instance.database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
