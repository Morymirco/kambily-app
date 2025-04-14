import 'package:flutter/material.dart';

import '../../core/controllers/product_controller.dart';
import '../../core/models/product.dart';

class BoutiquePage extends StatefulWidget {
  const BoutiquePage({super.key});

  @override
  State<BoutiquePage> createState() => _BoutiquePageState();
}

class _BoutiquePageState extends State<BoutiquePage> {
  final ProductController _productController = ProductController();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadProducts();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadProducts({bool refresh = false}) async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    
    try {
      await _productController.getProducts(refresh: refresh);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= 
        _scrollController.position.maxScrollExtent - 200) {
      _loadProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _loadProducts(refresh: true),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 0.75,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index < _productController.products.length) {
                      return ProductCard(
                        product: _productController.products[index],
                      );
                    } else if (_productController.hasMore) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return null;
                  },
                  childCount: _productController.hasMore
                      ? _productController.products.length + 1
                      : _productController.products.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  String? _getImageUrl() {
    if (product.images.isEmpty) return null;
    
    final imageUrl = product.images.first.imageUrl;
    if (imageUrl == null) return product.images.first.image;
    
    return imageUrl.toString();
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = _getImageUrl();
    final hasPromoPrice = product.promoPrice != null && product.promoPrice!.isNotEmpty;
    
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: imageUrl != null
                ? Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.error_outline),
                      );
                    },
                  )
                : const Center(
                    child: Icon(Icons.image_not_supported),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Krub',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '${product.regularPrice} FCFA',
                      style: TextStyle(
                        fontFamily: 'Krub',
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        decoration: hasPromoPrice
                            ? TextDecoration.lineThrough
                            : null,
                        color: hasPromoPrice
                            ? Colors.grey
                            : Colors.black,
                      ),
                    ),
                    if (hasPromoPrice) ...[
                      const SizedBox(width: 8),
                      Text(
                        '${product.promoPrice} FCFA',
                        style: const TextStyle(
                          fontFamily: 'Krub',
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: product.stockStatus
                        ? Colors.green.withOpacity(0.1)
                        : Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    product.stockStatus ? 'En stock' : 'Rupture de stock',
                    style: TextStyle(
                      fontFamily: 'Krub',
                      color: product.stockStatus ? Colors.green : Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 