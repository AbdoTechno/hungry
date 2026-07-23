import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hungry/core/network/dio_exception.dart';

class DioInterceptor extends Interceptor {
  final String? Function() getToken;

  DioInterceptor({required this.getToken});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final token = getToken();

    options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
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

    debugPrint(message);

    handler.next(err);
  }
}
