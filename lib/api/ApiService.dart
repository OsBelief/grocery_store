import 'HttpUtil.dart';

class ApiService {
  static Future<List<dynamic>> searchBooks(String path,
      {Map<String, dynamic> params}) async {
    Map<String, dynamic> result = await HttpUtil.get(path, params: params);
    print(result['books']);
    return new Future<List<dynamic>>(() {
      return result['books'];
    });
  }
}
