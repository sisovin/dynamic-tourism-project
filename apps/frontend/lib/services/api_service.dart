import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://your-api-url.com/api';

  Future<Response> getRequest(String endpoint) async {
    try {
      final response = await _dio.get('$_baseUrl$endpoint');
      return response;
    } catch (e) {
      throw Exception('Failed to GET data');
    }
  }

  Future<Response> postRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('$_baseUrl$endpoint', data: data);
      return response;
    } catch (e) {
      throw Exception('Failed to POST data');
    }
  }

  Future<Response> putRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put('$_baseUrl$endpoint', data: data);
      return response;
    } catch (e) {
      throw Exception('Failed to PUT data');
    }
  }

  Future<Response> deleteRequest(String endpoint) async {
    try {
      final response = await _dio.delete('$_baseUrl$endpoint');
      return response;
    } catch (e) {
      throw Exception('Failed to DELETE data');
    }
  }
}
