import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_response.freezed.dart';
part 'product_response.g.dart';

@freezed
abstract class ProductResponse with _$ProductResponse {
  const factory ProductResponse({
    @JsonKey(name: 'productId') int? productId,
    @JsonKey(name: 'brandCategoryId') int? brandCategoryId,
    @JsonKey(name: 'brandName') String? brandName,
    @JsonKey(name: 'categoryName') String? categoryName,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'images') List<Images>? images,
    @JsonKey(name: 'mrp') int? mrp,
    @JsonKey(name: 'isActive') bool? isActive,
  }) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String, Object?> json) => _$ProductResponseFromJson(json);
}

@freezed
abstract class Images with _$Images {
  const factory Images({
    @JsonKey(name: 'productImageId') int? productImageId,
    @JsonKey(name: 'productId') int? productId,
    @JsonKey(name: 'imagePath') String? imagePath,
  }) = _Images;

  factory Images.fromJson(Map<String, Object?> json) => _$ImagesFromJson(json);
}

