import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute('''CREATE TABLE quotes (
      id TEXT PRIMARY KEY NOT NULL,
      categoryID TEXT,
      content TEXT,
      author TEXT
    )''');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'quotes.db',
      version: 1,
      onCreate: (sql.Database db, version) async {
        print('...creating a tabls...');
        await createTables(db);
      },
    );
  }

  static Future<String> createItem(
    String id,
    String categoryID,
    String content,
    String? author,
  ) async {
    final db = await SQLHelper.db();
    final data = {
      'id': id,
      'categoryID': categoryID,
      'content': content,
      'author': author ?? ''
    };

    await db.insert(
      'quotes',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return 'Item created successfully!';
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('quotes');
  }

  static Future<List<Map<String, dynamic>>> getItem(String id) async {
    final db = await SQLHelper.db();
    return db.query('quotes', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<void> deleteItem(String id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("quotes", where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint("Something went wrong when deleting an item: $e");
    }
  }

  static Future<void> deleteAllItems() async {
    final db = await SQLHelper.db();
    try {
      await db.delete("quotes");
    } catch (e) {
      debugPrint("Something went wrong when deleting all items: $e");
    }
  }
}
