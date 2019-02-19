class LittleDart {
  static void main() {
    var typeTest = "Type test operators";
    print("typeTest is String, ${typeTest is String}");
    print("typeTest is String, ${typeTest is! String}");
    try {
      int test = typeTest as int;   /// as就是强制类型装换, 不推荐使用, 会增加release包的体积, https://mp.weixin.qq.com/s/IIoaY2uw6Bqzc9XWI91YFw
    } catch (e) {
      print(e.toString());
    }
    print("在Dart中一切都是对象 ${5 is Object}");
    print("在Dart中一切都是对象 ${null is Object}");
  }
}
