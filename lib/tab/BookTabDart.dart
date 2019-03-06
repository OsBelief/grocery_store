import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_store/api/ApiService.dart';
import 'package:grocery_store/db/Database.dart';
import 'package:grocery_store/tab/model/Book.dart';
import 'dart:math';

import 'package:grocery_store/tab/view/BookListItem.dart';

class BookTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookTabPageState();
  }
}

class _BookTabPageState extends State<BookTabPage> {
  List<String> testQuery = [
    "love",
    "boy",
    "girl",
    "world",
    "earth",
    "food",
    "beauty"
  ]; // 测试数据
  List<Book> result = List<Book>();

  @override
  void initState() {
    super.initState();
    loadLocal();
    requestBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图书"),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Center(
        child: inflateBody(),
      ),
    );
  }

  loadLocal() async {
    List<Book> bookList = await DBProvider().getAllBooks();
    if (bookList == null || bookList.isEmpty) return;
    setState(() {
      result = bookList;
    });
  }

  /// Dart和JavaScript中的async函数语义一致, async表示函数里有异步操作, await表示紧跟在后面的表达式需要等待结果
  /// Dart的Future和JavaScript的Promise类似
  Future<List<Book>> requestBooks() async {
    var rng = new Random();
    List<Book> _result = await ApiService.searchBooks(
        "https://api.douban.com/v2/book/search?q=" + testQuery[rng.nextInt(7)],
        params: null);
    setState(() {
      result = _result;
    });
    return _result;
  }

  inflateBody() {
    if (result.isNotEmpty) {
      return RefreshIndicator(
        child: ListView.builder(
            itemCount: result.length,
            itemBuilder: (BuildContext context, int position) {
              Book book = result[position];
              print("Book to Json: ${json.encode(book)}"); // 测试对象序列化
              return BookListItem(
                book: book,
              );
            }),
        onRefresh: requestBooks,
      );
    } else {
      return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue));
    }
  }
}
