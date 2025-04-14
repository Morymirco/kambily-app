import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  final int currentIndex;
  final Function(int) onPageChanged;

  const CustomDrawer({
    super.key,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      backgroundColor: isDarkMode ? AppColors.secondary : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // En-tête du drawer
          Container(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/kambily_logo.png',
                      width: 100,
                      height: 100,
                      color: isDarkMode ? Colors.white : null,
                    ),
               
                   
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: isDarkMode ? Colors.white : AppColors.textPrimary,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Menu principal
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MAIN MENU',
                  style: TextStyle(
                    fontFamily: 'Krub',
                    fontSize: 12,
                    color: Colors.grey[600],
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 16),
                _buildMenuItem(
                  context,
                  'Accueil',
                  isDarkMode,
                  isSelected: currentIndex == 0,
                  onTap: () => onPageChanged(0),
                ),
                _buildMenuItem(
                  context,
                  'Boutique',
                  isDarkMode,
                  isSelected: currentIndex == 1,
                  onTap: () => onPageChanged(1),
                ),
                _buildMenuItem(
                  context,
                  'Contact',
                  isDarkMode,
                  isSelected: currentIndex == 2,
                  onTap: () => onPageChanged(2),
                ),
                _buildMenuItem(
                  context,
                  'A propos de nous',
                  isDarkMode,
                  isSelected: currentIndex == 3,
                  onTap: () => onPageChanged(3),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Menu des catégories
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CATEGORY MENU',
                    style: TextStyle(
                      fontFamily: 'Krub',
                      fontSize: 12,
                      color: Colors.grey[600],
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Nos catégories',
                    style: TextStyle(
                      fontFamily: 'Krub',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode ? Colors.white : AppColors.textPrimary,
                    ),
                  ),
                  _buildCategoryItem('Électronique', isDarkMode),
                  _buildCategoryItem('Vêtements', isDarkMode),
                  _buildCategoryItem('Beauté & Soins', isDarkMode),
                  _buildCategoryItem('Accessoires', isDarkMode),
                  _buildCategoryItem('Bijouterie', isDarkMode),
                  _buildCategoryItem('Chaussures', isDarkMode),
                  _buildCategoryItem('Parfumerie', isDarkMode),
                ],
              ),
            ),
          ),
          // Section des coordonnées
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'COORDONNÉES',
                  style: TextStyle(
                    fontFamily: 'Krub',
                    fontSize: 12,
                    color: Colors.grey[600],
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 16),
                // Numéro de téléphone
                InkWell(
                  onTap: () {
                    // Lancer l'appel téléphonique
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 20,
                        color: isDarkMode ? Colors.white : AppColors.textPrimary,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '613 23 56 77',
                            style: TextStyle(
                              fontFamily: 'Krub',
                              fontSize: 14,
                              color: isDarkMode ? Colors.white : AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            'Vous pouvez appeler à tout moment de 8 h à 20 h.',
                            style: TextStyle(
                              fontFamily: 'Krub',
                              fontSize: 9,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Email
                InkWell(
                  onTap: () {
                    // Ouvrir l'application email
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        size: 20,
                        color: isDarkMode ? Colors.white : AppColors.textPrimary,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'contact@kambily.com',
                            style: TextStyle(
                              fontFamily: 'Krub',
                              fontSize: 14,
                              color: isDarkMode ? Colors.white : AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            'L\'e-mail que vous enverrez sera',
                            style: TextStyle(
                              fontFamily: 'Krub',
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    bool isDarkMode, {
    bool isSelected = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Krub',
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected
                ? AppColors.primary
                : (isDarkMode ? Colors.white : AppColors.textPrimary),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, bool isDarkMode) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Krub',
          fontSize: 14,
          color: isDarkMode ? Colors.white : AppColors.textPrimary,
        ),
      ),
      iconColor: isDarkMode ? Colors.white : AppColors.textPrimary,
      collapsedIconColor: isDarkMode ? Colors.white : AppColors.textPrimary,
      children: [
        // Sous-catégories si nécessaire
      ],
    );
  }
} 