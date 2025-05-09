import 'package:dio/dio.dart';
import 'api_service.dart';

class BlogService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> fetchBlogPosts() async {
    try {
      final response = await _apiService.getRequest('/blog/posts/');
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch blog posts');
    }
  }

  Future<Map<String, dynamic>> fetchBlogPostDetails(int id) async {
    try {
      final response = await _apiService.getRequest('/blog/posts/$id/');
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch blog post details');
    }
  }
}
