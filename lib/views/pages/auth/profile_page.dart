import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/services/auth_service.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _selectedMenu = 'profile'; // Menu par défaut

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mon Compte',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Menu en haut
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                _buildMenuItem(
                  icon: Icons.person,
                  title: 'Mon Profil',
                  onTap: () => setState(() => _selectedMenu = 'profile'),
                  isSelected: _selectedMenu == 'profile',
                ),
                _buildMenuItem(
                  icon: Icons.shopping_bag,
                  title: 'Mes Commandes',
                  onTap: () => setState(() => _selectedMenu = 'orders'),
                  isSelected: _selectedMenu == 'orders',
                ),
                _buildMenuItem(
                  icon: Icons.favorite,
                  title: 'Liste de Souhaits',
                  onTap: () => setState(() => _selectedMenu = 'wishlist'),
                  isSelected: _selectedMenu == 'wishlist',
                ),
                _buildMenuItem(
                  icon: Icons.location_on,
                  title: 'Mes Adresses',
                  onTap: () => setState(() => _selectedMenu = 'addresses'),
                  isSelected: _selectedMenu == 'addresses',
                ),
                _buildMenuItem(
                  icon: Icons.settings,
                  title: 'Paramètres',
                  onTap: () => setState(() => _selectedMenu = 'settings'),
                  isSelected: _selectedMenu == 'settings',
                ),
                _buildMenuItem(
                  icon: Icons.logout,
                  title: 'Déconnexion',
                  onTap: () => _showLogoutDialog(context),
                  color: Colors.red,
                ),
              ],
            ),
          ),
          // Contenu dynamique en bas
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedMenu) {
      case 'profile':
        return _buildProfileContent();
      case 'orders':
        return _buildOrdersContent();
      case 'wishlist':
        return _buildWishlistContent();
      case 'addresses':
        return _buildAddressesContent();
      case 'settings':
        return _buildSettingsContent();
      default:
        return _buildProfileContent();
    }
  }

  Widget _buildProfileContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Photo de profil et informations
          Center(
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primary,
                      width: 3,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://api.kambily.com/media/images/WhatsApp_Image_2025-03-17_%C3%A0_14.53.53_57779e79.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'amadou koulibaly',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Bio',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'je suis koulibaly amadou ! Développeur FullStack',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Navigation vers la page de modification du profil
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size(200, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Modifier le profil'),
                ),
                const SizedBox(height: 24),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Informations personnelles',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                _buildInfoItem('Prénom', 'amadou'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersContent() {
    return const Center(child: Text('Mes Commandes'));
  }

  Widget _buildWishlistContent() {
    return const Center(child: Text('Liste de Souhaits'));
  }

  Widget _buildAddressesContent() {
    return const Center(child: Text('Mes Adresses'));
  }

  Widget _buildSettingsContent() {
    return const Center(child: Text('Paramètres'));
  }

  Widget _buildInfoItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
    bool isSelected = false,
  }) {
    return Card(
      elevation: 0,
      color: isSelected 
          ? AppColors.primary.withOpacity(0.1)
          : color?.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected 
              ? AppColors.primary
              : color ?? Colors.grey[700],
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected 
                ? AppColors.primary
                : color ?? Colors.grey[800],
            fontWeight: isSelected 
                ? FontWeight.bold
                : FontWeight.w500,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: isSelected 
              ? AppColors.primary
              : color ?? Colors.grey[400],
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Déconnexion'),
        content: const Text('Voulez-vous vraiment vous déconnecter ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await AuthService.logout();
              if (context.mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                  (route) => false,
                );
              }
            },
            child: const Text(
              'Se déconnecter',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
} 