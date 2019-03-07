import 'package:annotation_route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_store/router/router.internal.dart';

/// flutter packages pub run build_runner clean清除生成的文件router.internal.dart
/// flutter packages pub run build_runner build --delete-conflicting-outputs重新生成router.internal.dart
@ARouteRoot()
class GroceryRouteOption {
  String urlPattern;
  Map<String, dynamic> params;

  GroceryRouteOption(this.urlPattern, this.params);
}

class GroceryRouter {
  static Future<dynamic> pushReplacement(
      BuildContext context, String urlPattern,
      [Map<String, dynamic> params]) {
    Widget page = getPageFromUrl(urlPattern, params);
    if (page == null)
      return null;
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  static Widget getPageFromUrl(String urlPattern,
      [Map<String, dynamic> params]) {
    ARouterInternal internal = ARouterInternalImpl();
    ARouterResult routerResult = internal.findPage(
        ARouteOption(urlPattern, params),
        GroceryRouteOption(urlPattern, params));
    if (routerResult.state == ARouterResultState.FOUND) {
      print("Find route page ${routerResult.widget}");
      return routerResult.widget;
    }
    print("Not find route page!");
    return null;
  }
}
