import '../network/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/constants.dart';

class AuthService {
  final ApiClient api;
  AuthService(this.api);

  Future<Map<String, dynamic>> login(String email, String password) async {
    final resp = await api.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
    if (resp.statusCode == 200) {
      final data = resp.data as Map<String, dynamic>;
      final prefs = await SharedPreferences.getInstance();
      if (data.containsKey('access_token')) {
        await prefs.setString(
          AppConstants.STORAGE_TOKEN_KEY,
          data['access_token'],
        );
      }
      return data;
    }
    throw Exception('Login failed');
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.STORAGE_TOKEN_KEY);
    await prefs.remove(AppConstants.STORAGE_REFRESH_TOKEN_KEY);
  }
}
