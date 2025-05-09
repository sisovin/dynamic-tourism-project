import 'package:dio/dio.dart';

class ContactService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://your-api-url.com/api';

  Future<void> submitContactForm(String name, String email, String message) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/contact/submit/',
        data: {'name': name, 'email': email, 'message': message},
      );
      // Handle the response, e.g., show a success message
    } catch (e) {
      throw Exception('Failed to submit contact form');
    }
  }
}
