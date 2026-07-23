abstract class BaseApiService {
  Future<dynamic> get(String url);
  Future<dynamic> post(String url, dynamic data);
  Future<dynamic> put(String url, dynamic data);
  Future<dynamic> delete(String url);
}
