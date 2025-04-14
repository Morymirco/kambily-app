import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return AppBar(
      backgroundColor: isDarkMode ? AppColors.secondary : Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/menu.svg',
          colorFilter: ColorFilter.mode(
            isDarkMode ? Colors.white : AppColors.textPrimary,
            BlendMode.srcIn,
          ),
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      centerTitle: true,
      title: SizedBox(
        height: 30,
        child: Image.asset(
          'assets/images/kambily_logo.png',
          fit: BoxFit.contain,
          color: isDarkMode ? Colors.white : null,
        ),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/cart.svg',
            colorFilter: ColorFilter.mode(
              isDarkMode ? Colors.white : AppColors.textPrimary,
              BlendMode.srcIn,
            ),
          ),
          onPressed: () {
            // Action du panier
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
} 