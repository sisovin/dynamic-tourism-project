import 'package:dio/dio.dart';
import 'api_service.dart';

class BookingService {
  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>> createBooking(Map<String, dynamic> bookingData) async {
    try {
      final response = await _apiService.postRequest('/bookings/', bookingData);
      return response.data;
    } catch (e) {
      throw Exception('Failed to create booking');
    }
  }

  Future<List<dynamic>> fetchBookings() async {
    try {
      final response = await _apiService.getRequest('/bookings/');
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch bookings');
    }
  }
}
