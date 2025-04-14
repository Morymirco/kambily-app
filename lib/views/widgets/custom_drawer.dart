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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Kambily',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.home,
            title: 'Accueil',
            index: 0,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.shopping_cart,
            title: 'Panier',
            index: 1,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.favorite,
            title: 'Favoris',
            index: 2,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.person,
            title: 'Profil',
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required int index,
  }) {
    final isSelected = currentIndex == index;
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? AppColors.primary : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppColors.primary : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        onPageChanged(index);
        Navigator.pop(context);
      },
      selected: isSelected,
      selectedTileColor: AppColors.primary.withOpacity(0.1),
    );
  }
} 