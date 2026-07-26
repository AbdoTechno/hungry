import 'package:hungry/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelpers {
  static Future<void> saveToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(AppConstants.tokenKey, token);
  }

  static Future<void> saveRefreshToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(AppConstants.refreshTokenKey, token);
  }

  static Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(AppConstants.tokenKey);
  }

  static Future<void> removeToken() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(AppConstants.tokenKey);
    await pref.remove(AppConstants.refreshTokenKey);
  }

}
