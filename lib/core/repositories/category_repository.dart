import '../services/dio_service.dart';
import '../models/category.dart';
import '../config/api_config.dart';

class CategoryRepository {
  final DioService _dioService = DioService();

  Future<List<Category>> getNestedCategories() async {
    try {
      final response = await _dioService.get('/categories/nested/');
      return (response.data as List)
          .map((json) => Category.fromJson(json))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
} 