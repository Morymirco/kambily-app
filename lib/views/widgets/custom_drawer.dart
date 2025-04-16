import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class CustomDrawer extends StatefulWidget {
  final int currentIndex;
  final Function(int) onPageChanged;

  const CustomDrawer({
    super.key,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Map<String, bool> expandedCategories = {};

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          // En-tête avec logo et bouton fermer
          Container(
            padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/kambily_logo.png',
                  height: 40,
                  width: 120,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                  padding: const EdgeInsets.all(8),
                  style: IconButton.styleFrom(
                    backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[100],
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),
          ),

          // Contenu défilable
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // MAIN MENU
                    Text(
                      'MENU PRINCIPAL',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    _buildMainMenuItem('Accueil', onTap: () {
                      widget.onPageChanged(0);
                      Navigator.pop(context);
                    }),
                    _buildMainMenuItem('Boutique'),
                    _buildMainMenuItem('Contact'),
                    _buildMainMenuItem('À propos de nous'),

                    const SizedBox(height: 32),

                    // CATEGORY MENU
                    Text(
                      'CATEGORY MENU',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Container(
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[900] : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: _buildCategoriesExpansionTile(),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Section COORDONNÉES fixée en bas
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'COORDONNÉES',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 16),

                _buildContactInfo(
                  icon: Icons.phone,
                  title: '613 23 56 77',
                  subtitle: 'Vous pouvez appeler à tout moment de 8 h à 20 h.',
                ),
                const SizedBox(height: 16),
                _buildContactInfo(
                  icon: Icons.email_outlined,
                  title: 'contact@kambily.com',
                  subtitle: 'L\'e-mail que vous enverrez sera répondu dans les plus brefs délais.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainMenuItem(String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: title == 'Accueil' && widget.currentIndex == 0
                ? AppColors.primary
                : Colors.grey[800],
            fontWeight: title == 'Accueil' && widget.currentIndex == 0
                ? FontWeight.w500
                : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesExpansionTile() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: const Text(
          'Nos catégories',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        children: [
          _buildSubCategory('Électronique'),
          _buildSubCategory('Vêtements'),
          _buildSubCategory('Beauté & Soins'),
          _buildSubCategory('Accessoires'),
          _buildSubCategory('Bijouterie'),
          _buildSubCategory('Chaussures'),
          _buildSubCategory('Parfumerie'),
        ],
      ),
    );
  }

  Widget _buildSubCategory(String title) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 32, right: 16),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey[600],
        ),
      ),
      onTap: () {
        // TODO: Navigation vers la catégorie
        Navigator.pop(context);
      },
    );
  }

  Widget _buildContactInfo({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 16, color: Colors.grey[600]),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 