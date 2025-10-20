import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../../locator.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = locator<AuthService>();
  bool _isAuthenticated = false;
  String? _userRole;

  bool get isAuthenticated => _isAuthenticated;
  String? get userRole => _userRole;

  Future<void> login(String email, String password) async {
    final data = await _authService.login(email, password);
    _userRole = (data['user']?['role'] ?? 'student') as String?;
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.logout();
    _isAuthenticated = false;
    _userRole = null;
    notifyListeners();
  }
}
