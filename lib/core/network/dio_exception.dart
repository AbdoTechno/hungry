import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_errors.dart';

class DioExceptionHandler {
  static ApiErrors handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiErrors(
          'Connection timeout with API server',
        );

      case DioExceptionType.sendTimeout:
        return ApiErrors('Send timeout with API server');

      case DioExceptionType.receiveTimeout:
        return ApiErrors('Receive timeout with API server');

      case DioExceptionType.badCertificate:
        return ApiErrors('Bad certificate with API server');

      case DioExceptionType.badResponse:
        return ApiErrors(
          _handleStatusCode(error.response?.statusCode),
        );

      case DioExceptionType.cancel:
        return ApiErrors(
          'Request to API server was cancelled',
        );

      case DioExceptionType.connectionError:
        return ApiErrors('Connection error occurred');

      case DioExceptionType.unknown:
        return ApiErrors('Unexpected error occurred');
      case DioExceptionType.transformTimeout:
        return ApiErrors(
          'Transform timeout with API server',
        );
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
