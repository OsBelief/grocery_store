import 'package:flutter/material.dart';

class MusicTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MusicTabPageState();
  }
}

class _MusicTabPageState extends State<MusicTabPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("音乐"),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Center(
          child: Text("这里是音乐"),
        ),
      ),
    );
  }
}
