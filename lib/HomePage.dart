import 'package:flutter/material.dart';
import 'tab/BookTabDart.dart';
import 'tab/MovieTabDart.dart';
import 'tab/MusicTabDart.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            BookTabPage(),
            MovieTabPage(),
            MusicTabPage(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            controller: tabController,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black26,
            tabs: <Widget>[
              Tab(
                text: "图书",
                icon: Icon(Icons.book),
              ),
              Tab(
                text: "电影",
                icon: Icon(Icons.movie),
              ),
              Tab(
                text: "音乐",
                icon: Icon(Icons.music_note),
              )
            ],
          ),
        ),
      ),
    );
  }
}
