// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  image: json['image'] as String?,
  imageUrl: json['image_url'] as String?,
  children:
      (json['children'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'image': instance.image,
  'image_url': instance.imageUrl,
  'children': instance.children,
};
