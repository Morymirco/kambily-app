import 'dart:convert';

import 'package:dio/dio.dart';

import '../constants/api_constants.dart';
import '../models/api_error.dart';
import '../models/auth/auth_response.dart';
import '../models/auth/login_request.dart';
import '../models/auth/register_request.dart';
import '../services/dio_service.dart';

class AuthRepository {
  final DioService _dioService = DioService();

  Future<AuthResponse> login(LoginRequest request) async {
    try {
      print('Login request: ${request.toJson()}'); // Debug

      final response = await _dioService.post(
        ApiConstants.login,
        data: request.toJson(),
      );
      
      print('API Response: ${response.data}'); // Debug

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['access_token'] != null) {
          try {
            final authResponse = AuthResponse.fromJson(response.data);
            print('Parsed AuthResponse: $authResponse'); // Debug
            return authResponse;
          } catch (e) {
            print('Error parsing response: $e'); // Debug
            throw ApiError(
              message: 'Erreur de format de réponse',
              errors: {'parse': ['Format de réponse invalide: ${e.toString()}']},
            );
          }
        } else {
          throw ApiError(message: 'Token manquant dans la réponse');
        }
      } else {
        throw ApiError(message: 'Erreur de connexion au serveur (${response.statusCode})');
      }
    } on DioException catch (e) {
      print('DioException: ${e.type} - ${e.message}'); // Debug
      print('Response data: ${e.response?.data}'); // Debug

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw ApiError(message: 'Le serveur met trop de temps à répondre');
      }

      if (e.type == DioExceptionType.connectionError) {
        throw ApiError(message: 'Impossible de se connecter au serveur');
      }

      if (e.response != null) {
        final errorData = e.response!.data;
        if (errorData is String) {
          try {
            final jsonData = jsonDecode(errorData);
            throw ApiError.fromJson(jsonData);
          } catch (_) {
            throw ApiError(message: errorData);
          }
        } else if (errorData is Map<String, dynamic>) {
          if (errorData['detail'] != null) {
            throw ApiError(message: errorData['detail']);
          }
          throw ApiError.fromJson(errorData);
        }
      }
      
      throw ApiError(message: 'Erreur de connexion: ${e.message}');
    } catch (e) {
      print('Unexpected error: $e'); // Debug
      throw ApiError(
        message: 'Une erreur inattendue est survenue',
        errors: {'unexpected': [e.toString()]},
      );
    }
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      final response = await _dioService.post('https://api.kambily.com/accounts/register/', data: request.toJson());
      return AuthResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
} 