import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final int id;
  final String name;
  final String? description;
  final String? image;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  final List<Category> children;

  Category({
    required this.id,
    required this.name,
    this.description,
    this.image,
    this.imageUrl,
    this.children = const [],
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
} 