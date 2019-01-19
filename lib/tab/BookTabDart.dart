import 'package:flutter/material.dart';
import 'package:grocery_store/api/ApiService.dart';

class BookTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookTabPageState();
  }
}

class _BookTabPageState extends State<BookTabPage> {
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
  void requestBooks() async {
    List<dynamic> _result = await ApiService.searchBooks(
        "https://api.douban.com/v2/book/search?q=love",
        params: null);
    setState(() {
      result = _result;
    });
  }

  createListItemVew(var book) {
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(
              book['image'],
              width: 100.0,
              height: 150.0,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
    return Card(
      child: row,
    );
  }

  inflateBody() {
    if (result.isNotEmpty) {
      return ListView.builder(
          itemCount: result.length,
          itemBuilder: (BuildContext context, int position) {
            return createListItemVew(result[position]);
          });
    } else {
      return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue));
    }
  }
}
