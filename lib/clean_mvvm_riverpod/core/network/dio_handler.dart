import 'package:dio/dio.dart';

class DioHandler {
  static final DioHandler _instance = DioHandler._internal();
  final Dio dio;

  factory DioHandler() {
    return _instance;
  }

  DioHandler._internal()
      : dio = Dio(BaseOptions(
          baseUrl: "https://api.coingecko.com/api/v3/",
          connectTimeout: Duration(milliseconds: 5000),
          receiveTimeout: Duration(milliseconds: 3000),
          headers: {
            "Accept": "application/json",
          },
        )) {
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await dio.get(path, queryParameters: queryParameters);
    } on DioError catch (e) {
      final errorResponse = "";
      throw errorResponse;
    }
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    try {
      return await dio.post(path, data: data);
    } on DioError catch (e) {
      final errorResponse = "";
      throw errorResponse;
    }
  }
}
