import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              _buildBannerItem(
                'Ici, y\'a tout\npour tout le\nmonde',
                'assets/images/bannier1.webp',
              ),
              // Ajoutez d'autres bannières ici
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3, // Nombre total de pages
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBannerItem(String title, String imagePath) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Krub',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
} 