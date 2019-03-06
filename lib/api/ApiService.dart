import 'dart:async';

import 'package:grocery_store/db/Database.dart';
import 'package:grocery_store/tab/model/Book.dart';
import 'package:grocery_store/tab/model/Movie.dart';

import 'HttpUtil.dart';

class ApiService {
  static Future<List<Book>> searchBooks(String path,
      {Map<String, dynamic> params}) async {
    print("searchBooks path=" + path);
    var response = await HttpUtil.get(path, params: params);
    print("searchBooks response.runtimeType ${response.runtimeType}");
    var booksJson = response["books"] as List;
    List<Book> bookList = booksJson.map((i) => Book.fromJson(i)).toList();
    if (bookList != null && bookList.isNotEmpty) {
      await DBProvider().clearBooks();
      await DBProvider().insertBooks(bookList);
    }
    return bookList;
  }

  static Future<List<Movie>> getHotMovies() async {
    var response = await HttpUtil.get(
        "https://api.douban.com/v2/movie/in_theaters",
        params: null);
    var movies = response["subjects"] as List;
    return movies.map(((i) => Movie.fromJson(i))).toList();
  }
}
