import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:grocery_store/tab/model/Book.dart';
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
          "item_id TEXT,"
          "item TEXT"
          ")");
    });
  }

  void insert(Book book) async {
    if (book == null) return;
    final db = await database;
    var map = <String, dynamic>{
      "item_id": book.id,
      "item": json.encode(book.toJson())
    };
    int id = await db.insert("book", map);
    print("insert book id=$id");
  }

  insertBooks(List<Book> books) async {
    if (books == null || books.isEmpty) return null;
    final db = await database;
    await db.transaction((txn) async {
      books.forEach((book) async {
        var map = <String, dynamic>{
          "item_id": book.id,
          "item": json.encode(book.toJson())
        };
        int id = await txn.insert("book", map);
        print("insertBooks book id=$id");
      });
    });
  }

  Future<Book> getBookById(String id) async {
    if (id == null || id.isEmpty) return null;
    final db = await database;
    List<Map<String, dynamic>> result =
        await db.query("book", where: "item_id=?", whereArgs: [id]);
    if (result.isEmpty) return null;
    return Book.fromJson(json.decode(result.first["item"]));
  }

  Future<List<Book>> getAllBooks() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query("book");
    if (result.isEmpty) return null;
    List<Book> bookList = List<Book>();
    result.forEach((values) {
      var itemJson = json.decode(values["item"]);
      print("getAllBooks itemJson=$itemJson");
      bookList.add(Book.fromJson(itemJson));
    });
    return bookList;
  }

  clearBooks() async {
    final db = await database;
    await db.delete("book");
  }
}
