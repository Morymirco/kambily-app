import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  final bool isFromOnboarding;
  
  const SplashScreen({
    super.key,
    this.isFromOnboarding = false,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  _navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    
    const bool isFirstTime = true;

    if (isFirstTime) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
    } 
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? AppColors.secondary : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Container(
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
            ),
            const SizedBox(height: 24),
            Text(
              'Kambily',
              style: TextStyle(
                fontFamily: 'Krub',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : AppColors.textPrimary,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: CircularProgressIndicator(
                color: AppColors.primary,
                strokeWidth: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 