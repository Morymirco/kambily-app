import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/auth/auth_response.dart';

class AuthService {
  static const _tokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _userKey = 'user';

  // Stockage du token et des données utilisateur
  static Future<void> saveAuthData(AuthResponse response) async {
    try {
      print('Saving auth data...'); // Debug
      final prefs = await SharedPreferences.getInstance();
      
      await prefs.setString(_tokenKey, response.token);
      await prefs.setString(_refreshTokenKey, response.refreshToken);
      await prefs.setString(_userKey, jsonEncode(response.user.toJson()));
      
      print('Auth data saved successfully'); // Debug
    } catch (e) {
      print('Error saving auth data: $e'); // Debug
      rethrow;
    }
  }

  // Récupération du token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Récupération du refresh token
  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey);
  }

  // Récupération des données utilisateur
  static Future<UserData?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userStr = prefs.getString(_userKey);
    if (userStr != null) {
      return UserData.fromJson(jsonDecode(userStr));
    }
    return null;
  }

  // Vérification de l'état de connexion
  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }

  // Déconnexion
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_userKey);
  }
} 