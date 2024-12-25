class ErrorResponse {
  final int code;
  final String message;

  ErrorResponse({required this.code, required this.message});

  @override
  String toString() {
    return 'ErrorResponse(code: $code, message: $message)';
  }
}
