import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_errors.dart';
import 'package:hungry/core/network/base_api_service.dart';
import 'package:hungry/core/network/dio_exception.dart';
import 'package:hungry/core/utils/pref_helpers.dart';
import 'package:hungry/features/auth/data/user_model.dart';
import 'login_response_model.dart';

class AuthRepo {
  final BaseApiService apiService;

  AuthRepo({required this.apiService});

  Future<void> login(String email, String password) async {
    try {
      final response = await apiService.post(
        "/auth/login",
        {"email": email, "password": password},
      );

      final login = LoginResponseModel.fromJson(
        response.data,
      );

      if (login.accessToken.isEmpty ||
          login.refreshToken.isEmpty) {
        throw const ApiErrors("Invalid Email or Password");
      }

      await PrefHelpers.saveToken(login.accessToken);

      await PrefHelpers.saveRefreshToken(
        login.refreshToken,
      );
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  // signup
  Future<UserModel> signup(
    String name,
    String email,
    String password,
    String avatar,
  ) async {
    try {
      final response = await apiService.post("/users/", {
        "name": name,
        "email": email,
        "password": password,
        "avatar": avatar,
      });

      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  // get user profile
  Future<UserModel> getUserProfile() async {
    try {
      final response = await apiService.get("/users/profile");

      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }
}
