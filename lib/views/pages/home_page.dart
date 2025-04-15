import 'package:flutter/material.dart';
import '../widgets/home/banner_carousel.dart';
import '../widgets/home/quality_section.dart';
import '../widgets/home/categories_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerCarousel(),
            const SizedBox(height: 24),
            QualitySection(isDarkMode: Theme.of(context).brightness == Brightness.dark),
            const SizedBox(height: 24),
            CategoriesGrid(isDarkMode: Theme.of(context).brightness == Brightness.dark),
          ],
        ),
      ),
    );
  }
} 