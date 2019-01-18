import 'package:flutter/material.dart';

class BookTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookTabPageState();
  }
}

class _BookTabPageState extends State<BookTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图书"),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Text("这里是图书"),
      ),
    );
  }
}
