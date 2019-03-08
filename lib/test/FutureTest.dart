import 'dart:async';

/// 学习Future, Dart的Future和JavaScript的Promise类似, 都是异步编程的范式, https://en.wikipedia.org/wiki/Futures_and_promises, 都表示执行还未完成, 未来的值不确定的意思
class FutureTest {
  static void test() async {
    print("Before the Future");
    Future(() {
      print("Running the Future");
      return 38;
    }).then((value) {
      print("Complete the Future $value");
    }, onError: (error) {
      print("Error the Future");
    }).catchError((error) {
      print("Catch Error the Future");
    });
    print("After the Future");

    /// 执行了onError回调, 不会再执行catchError
    Future(() {
      print("Running the Future test_1");
      String s;
      s.length;
      return 38;
    }).then((value) {
      print("Complete the Future test_1 $value");
    }, onError: (error) {
      print("Error the Future test_1");
    }).catchError((error) {
      print("Catch Error the Future test_1");
    });

    Future(() {
      print("Running the Future test_2");
      String s;
      s.length;
      return 38;
    }).then((value) {
      print("Complete the Future test_2 $value");
    }).catchError((error) {
      print("Catch Error the Future test_2");
    });

    int futureResult = await test1();
    print("Future执行结果:$futureResult");
  }

  static Future<int> test1() async {
    Future<int> future = Future(() {
      print("Running the Future test_3");
      String s;
      s.length;
      return 38;
    }).then((value) {
      print("Complete the Future test_3 $value");
      return 39;
    }).catchError((error) {
      print("Catch Error the Future test_3");
      return 40;
    }).timeout(Duration(seconds: 10), onTimeout: () {
      print("Future执行超时了");
      return 41;
    });
    return future;
  }
}
