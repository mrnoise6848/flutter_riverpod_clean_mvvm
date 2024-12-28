import 'package:dio/dio.dart';

class DioHandler {
  static final DioHandler _instance = DioHandler._internal();
  final Dio dio;

  factory DioHandler() {
    return _instance;
  }

  DioHandler._internal()
      : dio = Dio(
          BaseOptions(
            baseUrl: "https://api.coingecko.com/api/v3/",
            connectTimeout: Duration(milliseconds: 5000),
            receiveTimeout: Duration(milliseconds: 3000),
            headers: {
              "Accept": "application/json",
            },
          ),
        ) {
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<Response<T>> request<T>(
    String method, {
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    try {
      final options = Options(method: method);

      final response = await dio.request<T>(
        path,
        queryParameters: queryParameters,
        data: data,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      final errorResponse = _handleError(e);
      throw errorResponse;
    }
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await request<T>(
      'GET',
      path: path,
      queryParameters: queryParameters,
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    return await request<T>(
      'POST',
      path: path,
      data: data,
    );
  }

  String _handleError(DioException e) {
    String errorResponse = "";
    if (e.response != null) {
      errorResponse = "Error: ${e.response?.data}";
    } else if (e.type == DioExceptionType.connectionError) {
      errorResponse = "Connection Error: ${e.message}";
    } else {
      errorResponse = "Error: ${e.message}";
    }
    return errorResponse;
  }
}
