import 'package:flutter/material.dart';
import 'package:grocery_store/api/ApiService.dart';
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
  List<dynamic> result = List<dynamic>();

  @override
  void initState() {
    super.initState();
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

  /// Dart和JavaScript中的async函数语义一致, async表示函数里有异步操作, await表示紧跟在后面的表达式需要等待结果
  /// Dart的Future和JavaScript的Promise类似
  Future<List> requestBooks() async {
    var rng = new Random();
    var _result = await ApiService.searchBooks(
        "https://api.douban.com/v2/book/search?q=" + testQuery[rng.nextInt(7)],
        params: null);
    setState(() {
      result = _result['books'];
    });
    return _result['books'];
  }

  inflateBody() {
    if (result.isNotEmpty) {
      return RefreshIndicator(
        child: ListView.builder(
            itemCount: result.length,
            itemBuilder: (BuildContext context, int position) {
              var book = result[position];
              return BookListItem(
                  book: new Book(book["title"], book["author"], book["image"]));
            }),
        onRefresh: requestBooks,
      );
    } else {
      return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue));
    }
  }
}
