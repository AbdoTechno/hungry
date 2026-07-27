import 'package:dio/dio.dart';
import 'base_api_service.dart';
import 'dio_config.dart';

class DioApiService implements BaseApiService {
  DioApiService._();

  static final DioApiService _instance = DioApiService._();

  factory DioApiService() => _instance;

  final Dio _dio = DioConfig().getDio();

  @override
  Future<Response> get(String endPoint) {
    return _dio.get(endPoint);
  }

  @override
  Future<Response> post(String endPoint, dynamic data) {
    return _dio.post(endPoint, data: data);
  }

  @override
  Future<Response> put(String endPoint, dynamic data) {
    return _dio.put(endPoint, data: data);
  }

  @override
  Future<Response> delete(String endPoint) {
    return _dio.delete(endPoint);
  }
}
