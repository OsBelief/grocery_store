import 'package:flutter/material.dart';

class MovieTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MovieTabPageState();
  }
}

class _MovieTabPageState extends State<MovieTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("电影"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Text("这里是电影"),
      ),
    );
  }
}
