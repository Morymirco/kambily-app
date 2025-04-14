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
          children: const [
            BannerCarousel(),
            SizedBox(height: 24),
            QualitySection(),
            SizedBox(height: 24),
            CategoriesGrid(),
          ],
        ),
      ),
    );
  }
} 