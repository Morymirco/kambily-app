import 'package:flutter/material.dart';

import '../pages/auth/profile_page.dart';
import '../pages/boutique_page.dart';
import '../pages/favoris_page.dart';
import '../pages/home_page.dart';
import '../pages/panier_page.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/custom_drawer.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    BoutiquePage(),
    PanierPage(),
    FavorisPage(),
    ProfilePage(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
    Navigator.pop(context); // Ferme le drawer après la sélection
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: CustomDrawer(
        currentIndex: _currentIndex,
        onPageChanged: _onPageChanged,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
} 