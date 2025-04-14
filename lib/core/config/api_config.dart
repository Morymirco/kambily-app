class ApiConfig {
  static const String baseUrl = 'http://api.kambily.com';
  static const int connectTimeout = 5000;
  static const int receiveTimeout = 3000;
  
  static const String token = 'token';  // Clé pour le stockage du token
  
  // Endpoints
  static const String login = '/auth/login/';
  static const String register = '/auth/register/';
  static const String products = '/products/';
  static const String categories = '/categories/';
  static const String cart = '/cart/';
  static const String favorites = '/favorites/';
} 