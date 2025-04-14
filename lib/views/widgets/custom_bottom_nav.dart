import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: isDarkMode ? Colors.white70 : AppColors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontSize: 12),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/home.svg',
            colorFilter: ColorFilter.mode(
              currentIndex == 0 ? AppColors.primary : AppColors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/boutique.svg',
            colorFilter: ColorFilter.mode(
              currentIndex == 1 ? AppColors.primary : AppColors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'Boutique',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/panier.svg',
            colorFilter: ColorFilter.mode(
              currentIndex == 2 ? AppColors.primary : AppColors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'Panier',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/favoris.svg',
            colorFilter: ColorFilter.mode(
              currentIndex == 3 ? AppColors.primary : AppColors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'Favoris',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/profil.svg',
            colorFilter: ColorFilter.mode(
              currentIndex == 4 ? AppColors.primary : AppColors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'Profil',
        ),
      ],
    );
  }
} 