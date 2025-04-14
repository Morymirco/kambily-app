import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../layout/main_layout.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? AppColors.secondary : Colors.white;
    final waveColor = AppColors.primary.withOpacity(isDarkMode ? 0.2 : 0.1);
    final textColor = isDarkMode ? Colors.white : AppColors.textPrimary;
    final descriptionColor = isDarkMode 
        ? Colors.grey[400] 
        : Colors.grey[600];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // ClipPath supérieur
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: WaveClipperTop(),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: waveColor,
                ),
              ),
            ),
          ),
          // ClipPath inférieur
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: WaveClipperBottom(),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: waveColor,
                ),
              ),
            ),
          ),
          // Contenu principal
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  // Logo
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDarkMode 
                          ? Colors.white.withOpacity(0.1)
                          : Colors.grey.shade50,
                    ),
                    child: Image.asset(
                      'assets/images/logo.jpg',
                      height: 150,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Titre
                  Text(
                    'Bienvenue sur Kambily',
                    style: TextStyle(
                      fontFamily: 'Krub',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Description
                  Text(
                    'Découvrez notre sélection de vêtements tendance pour hommes et femmes. Profitez d\'une expérience shopping unique avec des prix compétitifs et une livraison rapide.',
                    style: TextStyle(
                      fontFamily: 'Krub',
                      fontSize: 16,
                      color: descriptionColor,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  // Bouton Commencer
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainLayout(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        elevation: isDarkMode ? 2 : 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Commencer',
                        style: TextStyle(
                          fontFamily: 'Krub',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Clipper pour la vague supérieure
class WaveClipperTop extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.8);
    
    var firstControlPoint = Offset(size.width * 0.25, size.height);
    var firstEndPoint = Offset(size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    
    var secondControlPoint = Offset(size.width * 0.75, size.height * 0.6);
    var secondEndPoint = Offset(size.width, size.height * 0.8);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );
    
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Clipper pour la vague inférieure
class WaveClipperBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * 0.2);
    
    var firstControlPoint = Offset(size.width * 0.25, 0);
    var firstEndPoint = Offset(size.width * 0.5, size.height * 0.2);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    
    var secondControlPoint = Offset(size.width * 0.75, size.height * 0.4);
    var secondEndPoint = Offset(size.width, size.height * 0.2);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );
    
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
} 