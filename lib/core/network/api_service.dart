import '../constants/api_endpoints.dart';

class ApiService {
  final String baseUrl;

  ApiService({this.baseUrl = ApiEndpoints.baseUrl});

  Future<Map<String, dynamic>> get(String path) async {
    // TODO: Replace with real HTTP logic.
    return <String, dynamic>{};
  }
}
