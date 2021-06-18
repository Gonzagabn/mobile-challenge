import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbUtil {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'favorites.db'),
      onCreate: (db, version) {
        return db
            .execute('CREATE TABLE favorites (id TEXT PRIMARY KEY, name TEXT)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object?> data) async {
    final db = await DbUtil.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> delete(String table, Map<String, Object?> data) async {
    final db = await DbUtil.database();
    await db.rawDelete(
      'DELETE FROM favorites WHERE name = ?',
      [data],
    );
  }

  static Future<void> get(String table, Map<String, Object?> data) async {
    final db = await DbUtil.database();
    await db.query(
      table,
      // where: 'name = ?',
      // whereArgs: [data],
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbUtil.database();
    return db.query(table);
  }
}
