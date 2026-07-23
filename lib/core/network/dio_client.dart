import 'package:hungry/core/network/base_api_service.dart';

class DioClient implements BaseApiService {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;
  DioClient._internal();


  @override
  Future<dynamic> delete(String url) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<dynamic> get(String url) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<dynamic> post(String url, data) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<dynamic> put(String url, data) {
    // TODO: implement put
    throw UnimplementedError();
  }}