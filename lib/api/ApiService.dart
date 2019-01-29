import 'HttpUtil.dart';

class ApiService {
  static Future searchBooks(String path, {Map<String, dynamic> params}) async {
    print("path=" + path);
    var response = await HttpUtil.get(path, params: params);
    return response;
  }
}
