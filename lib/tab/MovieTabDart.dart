import 'package:flutter/material.dart';
import 'package:grocery_store/api/ApiService.dart';
import 'package:grocery_store/tab/model/Movie.dart';

class MovieTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MovieTabPageState();
  }
}

class _MovieTabPageState extends State<MovieTabPage> {
  List<Movie> result = List<Movie>();

  @override
  void initState() {
    super.initState();
    getHotMovies();
  }

  Future<List<Movie>> getHotMovies() async {
    List<Movie> _movies = await ApiService.getHotMovies();
    setState(() {
      result = _movies;
    });
    return _movies;
  }

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
