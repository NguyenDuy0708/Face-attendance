class AppConstants {
  static const String BASE_URL_LARAVEL = String.fromEnvironment('BASE_URL_LARAVEL', defaultValue: 'https://api.example.com');
  static const String BASE_URL_PYTHON_AI = String.fromEnvironment('BASE_URL_PYTHON_AI', defaultValue: 'https://ai.example.com');
  static const String STORAGE_TOKEN_KEY = 'jwt_token';
  static const String STORAGE_REFRESH_TOKEN_KEY = 'refresh_token';
}
