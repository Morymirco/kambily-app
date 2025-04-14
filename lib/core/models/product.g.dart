// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: (json['id'] as num).toInt(),
  slug: json['slug'] as String?,
  name: json['name'] as String,
  shortDescription: json['short_description'] as String?,
  longDescription: json['long_description'] as String?,
  etatStock: json['etat_stock'] as String?,
  regularPrice: json['regular_price'] as String,
  promoPrice: json['promo_price'] as String?,
  sku: json['sku'] as String?,
  stockStatus: json['stock_status'] as bool,
  quantity: (json['quantity'] as num).toInt(),
  weight: (json['weight'] as num?)?.toDouble(),
  length: (json['length'] as num?)?.toDouble(),
  width: (json['width'] as num?)?.toDouble(),
  height: (json['height'] as num?)?.toDouble(),
  nombreVentes: (json['nombre_ventes'] as num).toInt(),
  productType: json['product_type'] as String?,
  isRecommended: json['is_recommended'] as bool,
  images:
      (json['images'] as List<dynamic>)
          .map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
          .toList(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'name': instance.name,
  'short_description': instance.shortDescription,
  'long_description': instance.longDescription,
  'etat_stock': instance.etatStock,
  'regular_price': instance.regularPrice,
  'promo_price': instance.promoPrice,
  'sku': instance.sku,
  'stock_status': instance.stockStatus,
  'quantity': instance.quantity,
  'weight': instance.weight,
  'length': instance.length,
  'width': instance.width,
  'height': instance.height,
  'nombre_ventes': instance.nombreVentes,
  'product_type': instance.productType,
  'is_recommended': instance.isRecommended,
  'images': instance.images,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

ProductImage _$ProductImageFromJson(Map<String, dynamic> json) => ProductImage(
  id: (json['id'] as num).toInt(),
  image: json['image'] as String,
  imageUrl: json['image_url'],
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  product: (json['product'] as num).toInt(),
);

Map<String, dynamic> _$ProductImageToJson(ProductImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'product': instance.product,
    };
