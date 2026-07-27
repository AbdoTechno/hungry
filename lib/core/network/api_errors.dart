class ApiErrors implements Exception {
  final String message;
  final int? code;

  const ApiErrors(this.message, {this.code});
}
