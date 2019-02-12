/// 学习Future
class FutureTest {
  static void test() {
    print("Before the Future");
    Future(() {
      print("Running the Future");
    }).then((_) {
      print("Complete the Future");
    });
    print("After the Future");
  }
}
