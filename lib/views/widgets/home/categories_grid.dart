import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/models/category.dart';
import '../../../core/repositories/category_repository.dart';

class CategoriesGrid extends StatefulWidget {
  final bool isDarkMode;

  const CategoriesGrid({
    super.key,
    required this.isDarkMode,
  });

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
      
      final allCategories = await _repository.getNestedCategories();
      final mainCategories = allCategories.where((cat) => cat.isMain).toList();
      
      setState(() {
        _categories = mainCategories;
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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(widget.isDarkMode ? 0.1 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // En-tête avec icône
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.grid_view,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Catégories',
                style: TextStyle(
                  fontFamily: 'Krub',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Description
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: 'Krub',
                fontSize: 14,
                color: Colors.grey,
              ),
              children: [
                const TextSpan(text: 'Ne perdez pas de temps, '),
                TextSpan(
                  text: 'trouvez votre catégorie !',
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Grille de catégories
          if (_isLoading)
            _buildLoadingSkeleton()
          else if (_error != null)
            _buildErrorWidget()
          else
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.85,
              children: _categories.map((category) => 
                _buildCategoryItem(category),
              ).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildLoadingSkeleton() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: List.generate(6, (index) => _buildSkeletonItem()),
    );
  }

  Widget _buildSkeletonItem() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 64,
          height: 16,
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 48,
          height: 12,
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(Category category) {
    return SizedBox(
      height: 140,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFA1CB41),
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: category.image != null
                      ? Image.network(
                          category.image!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(
                                Icons.category,
                                size: 32,
                                color: AppColors.primary,
                              ),
                        )
                      : Icon(
                          Icons.category,
                          size: 32,
                          color: AppColors.primary,
                        ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Flexible(
            child: Text(
              category.name,
              style: TextStyle(
                fontFamily: 'Krub',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: widget.isDarkMode ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (category.x > 0)
            Text(
              '${category.x} produits',
              style: TextStyle(
                fontFamily: 'Krub',
                fontSize: 10,
                color: widget.isDarkMode ? Colors.grey[600] : Colors.grey[400],
              ),
            ),
        ],
      ),
    );
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    }
    return number.toString();
  }

  Widget _buildErrorWidget() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Column(
        children: [
          Text(
            _error!,
            style: TextStyle(
              color: isDarkMode ? Colors.red[300] : Colors.red[600],
              fontFamily: 'Krub',
            ),
          ),
          TextButton(
            onPressed: _loadCategories,
            child: Text(
              'Réessayer',
              style: TextStyle(
                color: isDarkMode ? Colors.white : AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 