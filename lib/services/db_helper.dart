import 'dart:io';
import 'package:al_hadith_app/models/chapters_model.dart';
import 'package:al_hadith_app/models/hadith_model.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> initializeDatabase() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, "hadith_bn_test.db");
  // Check if database exists
  var exists = await databaseExists(path);
  if (!exists) {
    // Copy database from assets folder
    try {
      await _copyAssetToDatabase(path);
    } catch (e) {
      throw Exception("Error copying database: $e");
    }
  }
  // Open the database
  return await openDatabase(path, readOnly: true);
}

Future<void> _copyAssetToDatabase(String dbPath) async {
  var data = await rootBundle.load('assets/hadith_bn_test.db');
  var bytes = data.buffer.asUint8List();
  await File(dbPath).writeAsBytes(bytes);
}

Future<List<Map>> getBooks() async {
  final db = await initializeDatabase();
  List<Map> books = await db.rawQuery('SELECT * FROM books');
  await db.close();
  return books;
}

Future<List<ChapterModel>> getChaptersByBookId(int bookId) async {
  final db = await initializeDatabase();
  List<Map> chapters = await db.rawQuery('SELECT * FROM chapter WHERE book_id = $bookId');
  List<ChapterModel> chapterList = chapters.map((map) => ChapterModel.fromMap(map)).toList();
  await db.close();
  return chapterList;
}


Future<List<HadithModel>> getHadithByChapterAndBookId(int chapterId, int bookId) async {
  final db = await initializeDatabase();
  List<Map> hadith = await db.rawQuery(
      'SELECT * FROM hadith WHERE chapter_id = $chapterId AND book_id = $bookId');
  List<HadithModel> hadithList = hadith.map((map) => HadithModel.fromMap(map)).toList();
  await db.close();
  return hadithList;
}
