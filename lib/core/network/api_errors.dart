class ApiErrors implements Exception {
  final String message;
  final int? code;

  ApiErrors(this.message, {this.code});

  @override
  String toString() {
    return 'ApiErrors{message: $message, code: $code}';
  }
}
 