import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hungry/core/network/api_errors.dart';
import 'package:hungry/core/network/dio_exception.dart';
import 'package:hungry/core/utils/pref_helpers.dart';

class DioInterceptor extends Interceptor {
  final String? Function() getToken;

  DioInterceptor({required this.getToken});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await PrefHelpers.getToken();

    options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (kDebugMode) {
      debugPrint('''
╔════════════════ REQUEST ════════════════
║ ${options.method} ${options.uri}
║ Headers: ${options.headers}
║ Body: ${options.data}
╚═════════════════════════════════════════
''');
    }

    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (kDebugMode) {
      debugPrint('''
╔════════════════ RESPONSE ═══════════════
║ Status: ${response.statusCode}
║ URL: ${response.requestOptions.uri}
║ Data: ${response.data}
╚═════════════════════════════════════════
''');
    }

    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    final message = DioExceptionHandler.handle(err);

    debugPrint(ApiErrors(message as String) as String?);

    handler.next(err);
  }
}
