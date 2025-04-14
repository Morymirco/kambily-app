import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/models/category.dart';
import '../../../core/repositories/category_repository.dart';

class CategoriesGrid extends StatefulWidget {
  const CategoriesGrid({super.key});

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  final CategoryRepository _repository = CategoryRepository();
  List<Category> _categories = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });
      
      final categories = await _repository.getNestedCategories();
      
      setState(() {
        _categories = categories;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Erreur lors du chargement des catégories';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Catégories',
          style: TextStyle(
            fontFamily: 'Krub',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Ne perdez pas de temps, trouvez votre catégorie !',
          style: TextStyle(
            fontFamily: 'Krub',
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 16),
        if (_isLoading)
          const Center(
            child: CircularProgressIndicator(),
          )
        else if (_error != null)
          Center(
            child: Column(
              children: [
                Text(
                  _error!,
                  style: TextStyle(
                    color: Colors.red[600],
                    fontFamily: 'Krub',
                  ),
                ),
                TextButton(
                  onPressed: _loadCategories,
                  child: const Text('Réessayer'),
                ),
              ],
            ),
          )
        else
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: _categories.map((category) => 
              _buildCategoryItem(
                category.name,
                category.imageUrl ?? category.image ?? 'assets/icons/default_category.png',
              ),
            ).toList(),
          ),
      ],
    );
  }

  Widget _buildCategoryItem(String title, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageUrl.startsWith('http')
              ? Image.network(
                  imageUrl,
                  width: 40,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.category,
                      size: 40,
                      color: AppColors.primary,
                    );
                  },
                )
              : Image.asset(
                  imageUrl,
                  width: 40,
                  height: 40,
                ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Krub',
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
} 