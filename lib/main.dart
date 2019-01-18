import 'package:flutter/material.dart';
import 'FlashPage.dart';

void main() => runApp(GroceryStoreApp());

class GroceryStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GroceryStore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        primaryColorDark: Colors.white,
      ),
      home: FlashPage(),
    );
  }
}
