import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class QualitySection extends StatelessWidget {
  const QualitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        children: [
          Icon(
            Icons.verified_user_outlined,
            color: AppColors.primary,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Meilleure Qualité',
                  style: TextStyle(
                    fontFamily: 'Krub',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Nous offrons des produits de qualité supérieure pour une expérience d\'achat en toute confiance.',
                  style: TextStyle(
                    fontFamily: 'Krub',
                    fontSize: 12,
                    color: Colors.grey[600],
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