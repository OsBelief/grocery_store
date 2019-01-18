import 'package:flutter/material.dart';
import 'dart:async';
import 'HomePage.dart';

class FlashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlashPageState();
  }
}

class _FlashPageState extends State<FlashPage> {
  @override
  void initState() {
    super.initState();
    countDown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        child: Image.asset("assets/images/honeybee_icon.png"),
      ),
    );
  }

  void countDown() {
    var _duration = new Duration(seconds: 5);
    new Future.delayed(_duration, goToHome);
  }

  void goToHome() {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return new HomePage();
    }));
  }
}
