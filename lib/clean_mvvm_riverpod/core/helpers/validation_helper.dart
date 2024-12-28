class ValidationHelper {
  static bool isValidMobile(String value) {
    const pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    final regExp = RegExp(pattern);
    return value.isNotEmpty && regExp.hasMatch(value);
  }

  static bool isValidEmail(String value) {
    const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regExp = RegExp(pattern);
    return value.isNotEmpty && regExp.hasMatch(value);
  }
}
