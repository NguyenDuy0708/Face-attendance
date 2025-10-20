import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/constants.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio})
    : _dio = dio ?? Dio(BaseOptions(baseUrl: AppConstants.BASE_URL_LARAVEL)) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString(AppConstants.STORAGE_TOKEN_KEY);
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          options.headers['Accept'] = 'application/json';
          return handler.next(options);
        },
        onError: (err, handler) async {
          // TODO: 401 refresh token flow
          return handler.next(err);
        },
      ),
    );
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) =>
      _dio.get(path, queryParameters: queryParameters);
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) => _dio.post(
    path,
    data: data,
    queryParameters: queryParameters,
    options: options,
  );
  Future<Response> put(String path, {dynamic data}) =>
      _dio.put(path, data: data);
  Future<Response> delete(String path, {dynamic data}) =>
      _dio.delete(path, data: data);

  Dio get dio => _dio;
}
