import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: 'access_token')
  final String token;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  final UserData user;

  AuthResponse({
    required this.token,
    required this.refreshToken,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    try {
      if (json['access_token'] == null) {
        throw FormatException('Token manquant dans la réponse');
      }
      if (json['refresh_token'] == null) {
        throw FormatException('Refresh token manquant dans la réponse');
      }
      if (json['user'] == null) {
        throw FormatException('Données utilisateur manquantes dans la réponse');
      }
      return _$AuthResponseFromJson(json);
    } catch (e) {
      throw FormatException('Format de réponse invalide: ${e.toString()}');
    }
  }

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

  @override
  String toString() {
    return 'AuthResponse(token: $token, refreshToken: $refreshToken, user: $user)';
  }
}

@JsonSerializable()
class UserData {
  final int? id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String? role;
  final String? address;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  final bool? status;
  final String? bio;
  final String? image;
  @JsonKey(name: 'is_confirmed')
  final bool? isConfirmed;
  @JsonKey(name: 'is_accept_mail')
  final bool? isAcceptMail;
  @JsonKey(name: 'total_orders')
  final int? totalOrders;
  @JsonKey(name: 'total_favorites')
  final int? totalFavorites;
  @JsonKey(name: 'total_reviews')
  final int? totalReviews;
  final List<Address>? addresses;

  UserData({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.role,
    this.address,
    this.isActive,
    this.status,
    this.bio,
    this.image,
    this.isConfirmed,
    this.isAcceptMail,
    this.totalOrders,
    this.totalFavorites,
    this.totalReviews,
    this.addresses,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  @override
  String toString() {
    return 'UserData(firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber)';
  }
}

@JsonSerializable()
class Address {
  final int pk;
  final String address;
  final String ville;
  final String pays;
  final String telephone;

  Address({
    required this.pk,
    required this.address,
    required this.ville,
    required this.pays,
    required this.telephone,
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
} 