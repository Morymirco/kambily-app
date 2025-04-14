class ApiError {
  final String message;
  final Map<String, List<String>>? errors;

  ApiError({
    required this.message,
    this.errors,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    Map<String, List<String>>? errors;
    
    // Gestion des erreurs au format {"field": ["error1", "error2"]}
    if (json['errors'] != null) {
      errors = Map<String, List<String>>.from(
        json['errors'].map((key, value) => MapEntry(
          _getFieldName(key),
          (value as List).map((e) => e.toString()).toList(),
        )),
      );
    }
    // Gestion des erreurs au format {"detail": "error message"}
    else if (json['detail'] != null) {
      return ApiError(message: json['detail']);
    }
    // Gestion des erreurs au format {"message": "error message"}
    else if (json['message'] != null) {
      return ApiError(message: json['message']);
    }

    return ApiError(
      message: json['message'] ?? 'Une erreur est survenue',
      errors: errors,
    );
  }

  static String _getFieldName(String key) {
    switch (key) {
      case 'email':
        return 'Email';
      case 'password':
        return 'Mot de passe';
      case 'non_field_errors':
        return 'Erreur';
      default:
        return key;
    }
  }

  String get formattedMessage {
    if (errors == null) {
      switch (message.toLowerCase()) {
        case 'invalid credentials':
          return 'Email ou mot de passe incorrect';
        case 'user not found':
          return 'Utilisateur non trouvé';
        case 'network error':
          return 'Erreur de connexion. Veuillez vérifier votre connexion internet';
        default:
          return message;
      }
    }

    final errorMessages = errors!.entries.map((e) {
      final field = e.key;
      final messages = e.value.map((msg) {
        switch (msg.toLowerCase()) {
          case 'this field is required':
            return 'Ce champ est requis';
          case 'enter a valid email address':
            return 'Veuillez entrer une adresse email valide';
          case 'password too short':
            return 'Le mot de passe doit contenir au moins 6 caractères';
          default:
            return msg;
        }
      }).join(', ');
      return '$field : $messages';
    }).join('\n');

    return errorMessages;
  }
} 