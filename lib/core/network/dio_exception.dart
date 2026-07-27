import 'package:dio/dio.dart';
import 'api_errors.dart';

class DioExceptionHandler {
  static ApiErrors handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ApiErrors("Connection timeout");

      case DioExceptionType.sendTimeout:
        return const ApiErrors("Send timeout");

      case DioExceptionType.receiveTimeout:
        return const ApiErrors("Receive timeout");

      case DioExceptionType.connectionError:
        return const ApiErrors("No Internet Connection");

      case DioExceptionType.badCertificate:
        return const ApiErrors("Bad Certificate");

      case DioExceptionType.cancel:
        return const ApiErrors("Request Cancelled");

      case DioExceptionType.unknown:
        return const ApiErrors("Unexpected Error");

      case DioExceptionType.transformTimeout:
        return const ApiErrors("Transform Timeout");

      case DioExceptionType.badResponse:
        return _statusCode(error.response?.statusCode);
    }
  }

  static ApiErrors _statusCode(int? code) {
    switch (code) {
      case 400:
        return const ApiErrors("Bad Request");

      case 401:
        return const ApiErrors("Invalid Email or Password");

      case 403:
        return const ApiErrors("Forbidden");

      case 404:
        return const ApiErrors("Not Found");

      case 500:
        return const ApiErrors("Server Error");

      default:
        return const ApiErrors("Something went wrong");
    }
  }
}
