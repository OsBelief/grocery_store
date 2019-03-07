import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tab/BookTabDart.dart';
import 'tab/MovieTabDart.dart';
import 'tab/MusicTabDart.dart';
import 'package:annotation_route/route.dart';
import 'package:grocery_store/router/router.dart';

@ARoute(url: "grocery://home")
class HomePage extends StatefulWidget {
  final GroceryRouteOption routeOption;

  HomePage(this.routeOption);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    tabController.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("监听应用生命周期, 类似Android Activity的生命周期---$state");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ));
  }
}
