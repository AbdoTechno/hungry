import 'package:dio/dio.dart';
import 'package:hungry/core/constants/api_endpoints.dart';

import 'dio_interceptor.dart';

class DioConfig {
  DioConfig._();

  static final DioConfig _instance = DioConfig._();

  factory DioConfig() => _instance;

  late final Dio dio = _createDio();

  Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        validateStatus: (status) {
          return status != null && status < 500;
        },
      ),
    );
    dio.interceptors.add(
      DioInterceptor(
        getToken: () {
          // return token from secure storage
          return null;
        },
      ),
    );

    return dio;
  }

  Dio getDio() => dio;
}
