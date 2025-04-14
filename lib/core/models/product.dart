import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String? slug;
  final String name;
  @JsonKey(name: 'short_description')
  final String? shortDescription;
  @JsonKey(name: 'long_description')
  final String? longDescription;
  @JsonKey(name: 'etat_stock')
  final String? etatStock;
  @JsonKey(name: 'regular_price')
  final String regularPrice;
  @JsonKey(name: 'promo_price')
  final String? promoPrice;
  final String? sku;
  @JsonKey(name: 'stock_status')
  final bool stockStatus;
  final int quantity;
  final double? weight;
  final double? length;
  final double? width;
  final double? height;
  @JsonKey(name: 'nombre_ventes')
  final int nombreVentes;
  @JsonKey(name: 'product_type')
  final String? productType;
  @JsonKey(name: 'is_recommended')
  final bool isRecommended;
  final List<ProductImage> images;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  Product({
    required this.id,
    this.slug,
    required this.name,
    this.shortDescription,
    this.longDescription,
    this.etatStock,
    required this.regularPrice,
    this.promoPrice,
    this.sku,
    required this.stockStatus,
    required this.quantity,
    this.weight,
    this.length,
    this.width,
    this.height,
    required this.nombreVentes,
    this.productType,
    required this.isRecommended,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class ProductImage {
  final int id;
  final String image;
  @JsonKey(name: 'image_url')
  final Object? imageUrl;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final int product;

  ProductImage({
    required this.id,
    required this.image,
    this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => _$ProductImageFromJson(json);
  Map<String, dynamic> toJson() => _$ProductImageToJson(this);
} 