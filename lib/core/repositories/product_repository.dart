import '../services/dio_service.dart';
import '../models/product.dart';
import '../config/api_config.dart';

class ProductRepository {
  final DioService _dioService = DioService();

  Future<Map<String, dynamic>> getProducts({int page = 1}) async {
    try {
      final response = await _dioService.get(
        ApiConfig.products,
        queryParameters: {'page': page},
      );
      
      final List<Product> products = (response.data['results'] as List)
          .map((json) => Product.fromJson(json))
          .toList();
          
      return {
        'products': products,
        'count': response.data['count'] as int,
        'hasMore': products.length * page < (response.data['count'] as int),
      };
    } catch (e) {
      rethrow;
    }
  }

  Future<Product> getProduct(int id) async {
    try {
      final response = await _dioService.get('${ApiConfig.products}$id/');
      return Product.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
} 