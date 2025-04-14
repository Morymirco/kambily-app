// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
  token: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
  user: UserData.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'access_token': instance.token,
      'refresh_token': instance.refreshToken,
      'user': instance.user,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  id: (json['id'] as num?)?.toInt(),
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  email: json['email'] as String,
  phoneNumber: json['phone_number'] as String,
  role: json['role'] as String?,
  address: json['address'] as String?,
  isActive: json['is_active'] as bool?,
  status: json['status'] as bool?,
  bio: json['bio'] as String?,
  image: json['image'] as String?,
  isConfirmed: json['is_confirmed'] as bool?,
  isAcceptMail: json['is_accept_mail'] as bool?,
  totalOrders: (json['total_orders'] as num?)?.toInt(),
  totalFavorites: (json['total_favorites'] as num?)?.toInt(),
  totalReviews: (json['total_reviews'] as num?)?.toInt(),
  addresses:
      (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'email': instance.email,
  'phone_number': instance.phoneNumber,
  'role': instance.role,
  'address': instance.address,
  'is_active': instance.isActive,
  'status': instance.status,
  'bio': instance.bio,
  'image': instance.image,
  'is_confirmed': instance.isConfirmed,
  'is_accept_mail': instance.isAcceptMail,
  'total_orders': instance.totalOrders,
  'total_favorites': instance.totalFavorites,
  'total_reviews': instance.totalReviews,
  'addresses': instance.addresses,
};

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
  pk: (json['pk'] as num).toInt(),
  address: json['address'] as String,
  ville: json['ville'] as String,
  pays: json['pays'] as String,
  telephone: json['telephone'] as String,
);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'pk': instance.pk,
  'address': instance.address,
  'ville': instance.ville,
  'pays': instance.pays,
  'telephone': instance.telephone,
};
