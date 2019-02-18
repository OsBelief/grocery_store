import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiver/async.dart';

import 'HomePage.dart';
import 'test/FutureTest.dart';
import 'test/AsyncMethodTest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlashPageState();
  }
}

class _FlashPageState extends State<FlashPage> {
  int duration;
  CountdownTimer countdownTimer;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    getDelayDuration().then((int delayDuration) {
      debugPrint("delay duration $delayDuration");
      setState(() => duration = delayDuration);
      countdownTimer = CountdownTimer(
          new Duration(seconds: delayDuration), new Duration(seconds: 1));
      countdownTimer.listen((timer) {
        if (!mounted) return;
        debugPrint("CountdownTimer---remaining=" +
            timer.remaining.inSeconds.toString() +
            ", elapsed=" +
            timer.elapsed.inSeconds.toString());

        /// lambda表达式, Java/JavaScript/Dart都支持, 表示将匿名函数(Java中是函数式接口)赋值给变量的简写形式, 语法上略有不同
        /// (参数列表)=>{函数声明}
        /// (参数列表)=>单一表达式
        setState(() => duration = (delayDuration - timer.elapsed.inSeconds));
      }, onDone: () {
        debugPrint("CountdownTimer---onDone");
        goToHome();
      });
    });

    print("-----");
    FutureTest.test();
    print("-----");
    AsyncMethodTest.test();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 18,
                  right: 24,
                  child: GestureDetector(
                      onTap: () {
                        countdownTimer.cancel();
                        goToHome();
                      },
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                            ),
                            width: 40,
                            child: Text(
                              "$duration s",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          )))),
              Image.asset("assets/images/honeybee_icon.png"),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("FlashPage---dispose");
    if (countdownTimer.isRunning) {
      countdownTimer.cancel();
    }
  }

  void goToHome() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }

  /// SharedPreferences的使用
  Future<int> getDelayDuration() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int duration = prefs.getInt("flash_delay");

    print("Flash Delay Duration $duration");
    duration = duration ?? 5;   /// 等价于duration != null? duration : 5;

    duration = (duration % 2 == 0) ? 5 : 4;
    await prefs.setInt("flash_delay", duration);
    return duration;
  }
}
