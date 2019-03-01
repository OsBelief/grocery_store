class LittleDart {
  static void main() {
    var typeTest = "Type test operators";
    print("typeTest is String, ${typeTest is String}");
    print("typeTest is String, ${typeTest is! String}");
    try {
      int test = typeTest as int;

      /// as就是强制类型装换, 不推荐使用, 会增加release包的体积, https://mp.weixin.qq.com/s/IIoaY2uw6Bqzc9XWI91YFw
    } catch (e) {
      print(e.toString());
    }
    print("在Dart中一切都是对象 ${5 is Object}");
    print("在Dart中一切都是对象 ${null is Object}");

    Point point = Point(-1, -1);
    print("get/set x=${point._x}, y=${point._y}");
    point.x = 2;

    /// 实际调用的是int get x => _x;
    point.y = 2;

    /// 实际调用的是set x(int v) => _x = x;
    print("get/set x=${point.x}, y=${point.y}");
  }
}

class Point {
  int _x;
  int _y;

  Point(this._x, this._y);

  /// get/set类似java, 是对属性的简便访问形式, Dart不建议get/set像java一样只是为了封装属性, 编译时lint检查会有提醒
  int get x => _x;

  set x(int v) => _x = x;

  int get y => _y;

  set y(int v) {
    print(v);
    _y = v;
  }
}
