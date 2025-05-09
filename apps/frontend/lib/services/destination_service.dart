import 'package:dio/dio.dart';
import 'api_service.dart';

class DestinationService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> fetchDestinations() async {
    try {
      final response = await _apiService.getRequest('/destinations/');
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch destinations');
    }
  }

  Future<Map<String, dynamic>> fetchDestinationDetails(int id) async {
    try {
      final response = await _apiService.getRequest('/destinations/$id/');
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch destination details');
    }
  }
}
