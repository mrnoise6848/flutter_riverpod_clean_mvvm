class ApiResponse<T> {
  final T data;
  final String message;
  final int statusCode;

  ApiResponse({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonFunc) {
    return ApiResponse(
      data: fromJsonFunc(json['data']),
      message: json['message'] ?? '',
      statusCode: json['status_code'] ?? 200,
    );
  }
}
