import 'package:dio/dio.dart';

class DioExceptionHandler {
  static String handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout with API server';

      case DioExceptionType.sendTimeout:
        return 'Send timeout with API server';

      case DioExceptionType.receiveTimeout:
        return 'Receive timeout with API server';

      case DioExceptionType.badCertificate:
        return 'Bad certificate with API server';

      case DioExceptionType.badResponse:
        return _handleStatusCode(
          error.response?.statusCode,
        );

      case DioExceptionType.cancel:
        return 'Request to API server was cancelled';

      case DioExceptionType.connectionError:
        return 'Connection error occurred';

      case DioExceptionType.unknown:
        return 'Unexpected error occurred';

      case DioExceptionType.transformTimeout:
        return 'Transform timeout with API server';
    }
  }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';

      case 401:
        return 'Unauthorized request';

      case 403:
        return 'Access forbidden';

      case 404:
        return 'Resource not found';

      case 500:
        return 'Internal server error';

      default:
        return 'Something went wrong';
    }
  }
}
