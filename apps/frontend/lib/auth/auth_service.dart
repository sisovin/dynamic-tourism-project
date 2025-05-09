import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://your-api-url.com/api';

  Future<void> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/auth/login/',
        data: {'email': email, 'password': password},
      );
      // Handle the response, e.g., save the token
    } catch (e) {
      throw Exception('Failed to login');
    }
  }

  Future<void> register(String email, String password) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/auth/register/',
        data: {'email': email, 'password': password},
      );
      // Handle the response, e.g., save the token
    } catch (e) {
      throw Exception('Failed to register');
    }
  }
}
