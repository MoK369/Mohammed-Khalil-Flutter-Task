import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  static Database? _db;

  Future<Database> get dbInstance async {
    if (_db == null) {
      _db = await initDB();
      return _db!;
    } else {
      return _db!;
    }
  }

  Future<Database> initDB() async {
    String databasePath = await getDatabasesPath();
    String fullPath = join(databasePath, "otex_app.db");
    return openDatabase(
      fullPath,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {}
  Future<void> _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute("""
    CREATE TABLE IF NOT EXISTS categories (
      id INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT,
      name TEXT NOT NULL);
    """);
    batch.execute("""
      CREATE TABLE IF NOT EXISTS subcategories (
      id INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT,
      name TEXT NOT NULL,
      category_id INTEGER NOT NULL,
      FOREIGN KEY (category_id) REFERENCES categories(id),
      image_url TEXT NOT NULL);
      """);
    batch.execute("""
     CREATE TABLE IF NOT EXISTS plans (
      id INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT,
      title TEXT NOT NULL,
      price REAL NOT NULL,
      duration TEXT NOT NULL,
      features TEXT NOT NULL);
      """);
    batch.execute("""
     CREATE TABLE IF NOT EXISTS products(
      id INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT,
      name TEXT NOT NULL,
      description TEXT NOT NULL,
      price REAL NOT NULL,
      discount REAL NOT NULL,
      total_sold INTEGER NOT NULL,
      category_id INTEGER NOT NULL,
      FOREIGN KEY (category_id) REFERENCES categories(id),
      subcategory_id INTEGER NOT NULL,
      FOREIGN KEY (subcategory_id) REFERENCES subcategories(id),
      image_url TEXT NOT NULL,
      plan_id INTEGER NOT NULL,
      FOREIGN KEY (plan_id) REFERENCES plans(id));
      """);
    batch.execute("""
     CREATE TABLE IF NOT EXISTS Estates (
      id INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT,
      title TEXT NOT NULL,
      description TEXT NOT NULL,
      price REAL NOT NULL,
      category_id INTEGER NOT NULL,
      FOREIGN KEY (category_id) REFERENCES categories(id),
      subcategory_id INTEGER NOT NULL,
      FOREIGN KEY (subcategory_id) REFERENCES subcategories(id),
      image_url TEXT NOT NULL,
      plan_id INTEGER NOT NULL,
      FOREIGN KEY (plan_id) REFERENCES plans(id),
      location TEXT NOT NULL,
      status TEXT NOT NULL,
      type TEXT NOT NULL,
      rooms INTEGER NOT NULL,
      monthly_payments REAL NOT NULL,
      payment_type TEXT NOT NULL);
      """);
    await batch.commit();
  }

  // SELECT
  Future<T?> selectData<T>({
    required String tableName,
    required List<String> columns,
    required String where,
    required List<String> whereArgs,
    required T Function(Map<String, dynamic>) fromMap,
  }) async {
    var db = await dbInstance;
    List<Map> maps = await db.query(
      tableName,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
    );
    if (maps.isNotEmpty) {
      return fromMap(maps.first as Map<String, dynamic>);
    }
    return null;
  }

  // INSERT
  Future<int> insert<T>({
    required String tableName,
    required T dataModel,
    required Map<String, dynamic> Function() toMap,
  }) async {
    var db = await dbInstance;
    return db.insert(
      tableName,
      toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // UPDATE
  Future<int> update<T>({
    required String tableName,
    required T dataModel,
    required Map<String, dynamic> Function() toMap,
    required String where,
    required List<String> whereArgs,
  }) async {
    var db = await dbInstance;
    return db.update(tableName, toMap(), where: where, whereArgs: whereArgs);
  }

  // DELETE
  Future<int> delete<T>({
    required String tableName,
    required T dataModel,
    required String where,
    required List<String> whereArgs,
  }) async {
    var db = await dbInstance;
    return db.delete(tableName, where: where, whereArgs: whereArgs);
  }
}
