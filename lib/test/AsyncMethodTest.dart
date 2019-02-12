/// 学习async/await
class AsyncMethodTest {
  static test() async {
    methodA();
    await methodB();
    await methodC("main");
    methodD();
  }

  static methodA() {
    print("method A");
  }

  static methodB() async {
    print("B start");
    await methodC("B");
    print("B end");
  }

  static methodC(String from) async {
    print("C start from $from");
    await Future(() {
      print("C running Future from $from");
    }).then((_) {
      print("C end of Future from $from");
    });
    print("C end from $from");
  }

  static methodD() {
    print("method D");
  }
}
