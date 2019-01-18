import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiver/async.dart';

import 'HomePage.dart';

class FlashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlashPageState();
  }
}

class _FlashPageState extends State<FlashPage> {
  static const int DEFAULT_FLASH_DURATION = 5;
  int duration;
  CountdownTimer countdownTimer;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    setState(() => duration = DEFAULT_FLASH_DURATION);
    countdownTimer = CountdownTimer(
        new Duration(seconds: DEFAULT_FLASH_DURATION),
        new Duration(seconds: 1));
    countdownTimer.listen((timer) {
      if (!mounted) return;
      debugPrint("CountdownTimer---remaining=" +
          timer.remaining.inSeconds.toString() +
          ", elapsed=" +
          timer.elapsed.inSeconds.toString());
      setState(
          () => duration = (DEFAULT_FLASH_DURATION - timer.elapsed.inSeconds));
    }, onDone: () {
      debugPrint("CountdownTimer---onDone");
      goToHome();
    });
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
}
