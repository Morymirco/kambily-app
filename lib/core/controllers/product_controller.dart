import 'dart:developer' as developer;
import '../repositories/product_repository.dart';
import '../models/product.dart';

class ProductController {
  final ProductRepository _repository = ProductRepository();
  int _currentPage = 1;
  bool _hasMore = true;
  final List<Product> _products = [];
  
  List<Product> get products => _products;
  bool get hasMore => _hasMore;
  
  Future<void> getProducts({bool refresh = false}) async {
    try {
      if (refresh) {
        _currentPage = 1;
        _products.clear();
      }
      
      if (!_hasMore) return;
      
      final result = await _repository.getProducts(page: _currentPage);
      
      _products.addAll(result['products']);
      _hasMore = result['hasMore'];
      _currentPage++;

      // Affichage des produits dans la console
      developer.log('Nombre total de produits: ${_products.length}');
      for (var product in result['products']) {
        developer.log('''
Produit:
  - ID: ${product.id}
  - Nom: ${product.name}
  - Prix: ${product.regularPrice} FCFA
  - Prix promo: ${product.promoPrice ?? 'Pas de promotion'}
  - Stock: ${product.stockStatus ? 'En stock' : 'Rupture de stock'}
  - Quantité: ${product.quantity}
  - Dimensions: ${product.length ?? 0}x${product.width ?? 0}x${product.height ?? 0} cm
  - Poids: ${product.weight ?? 0} kg
  - Ventes: ${product.nombreVentes}
  - Images: ${product.images.length} image(s)
  - Créé le: ${product.createdAt}
----------------------------------------
''');
      }
      
    } catch (e) {
      developer.log('Erreur lors du chargement des produits: $e', error: e);
      rethrow;
    }
  }
} 