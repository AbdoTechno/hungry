import 'package:dio/dio.dart';
import 'package:hungry/core/network/base_api_service.dart';
import 'package:hungry/core/network/dio_config.dart';
import 'package:hungry/core/network/dio_exception.dart';

class DioApiService implements BaseApiService {
  static final DioApiService _instance =
      DioApiService._internal();
  factory DioApiService() => _instance;
  DioApiService._internal();

  final _dio = DioConfig().getDio();

  // get
  @override
  Future<dynamic> get(String endPoint) async {
    try {
      final response = await _dio.get(endPoint);
      return response;
    } catch (e) {
      throw DioExceptionHandler.handle(e as DioException);
    }
  }

  // post
  @override
  Future<dynamic> post(String endPoint, data) async {
    try {
      final response = await _dio.post(
        endPoint,
        data: data,
      );
      return response;
    } catch (e) {
      throw DioExceptionHandler.handle(e as DioException);
    }
  }

  // put
  @override
  Future<dynamic> put(String endPoint, data) async {
    try {
      final response = await _dio.put(endPoint, data: data);
      return response;
    } catch (e) {
      throw DioExceptionHandler.handle(e as DioException);
    }
  }

  @override
  Future<dynamic> delete(String endPoint) async {
    try {
      final response = await _dio.delete(endPoint);
      return response;
    } catch (e) {
      throw DioExceptionHandler.handle(e as DioException);
    }
  }
}
