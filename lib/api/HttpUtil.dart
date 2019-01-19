import 'package:dio/dio.dart';

class HttpUtil {
  static final Dio _dio = new Dio(new Options(
    connectTimeout: 15000,
    receiveTimeout: 15000,
    followRedirects: true,
  ));

  static Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic> params}) async {
    Response<Map<String, dynamic>> response;
    if (null != params) {
      response = await _dio.get(path, data: params);
    } else {
      response = await _dio.get(path);
    }
    return response.data;
  }
}
