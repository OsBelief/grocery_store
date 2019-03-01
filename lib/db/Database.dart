import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final DBProvider _singleton = DBProvider._internal();

  /// 工厂构造器, 可以用来从缓存中获取实例, 或构造子类的实例, 这里用来实现单例
  factory DBProvider() {
    return _singleton;
  }

  /// 私有构造方法Class._someName
  DBProvider._internal();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "grocery_store.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE book ("
          "id INTEGER PRIMARY KEY,"
          "item TEXT"
          ")");
    });
  }
}
