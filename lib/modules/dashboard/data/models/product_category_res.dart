import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category_res.freezed.dart';
part 'product_category_res.g.dart';

@freezed
abstract class ProductCategoryRes with _$ProductCategoryRes {
  const factory ProductCategoryRes({
    @JsonKey(name: 'categoryId') int? categoryId,
    @JsonKey(name: 'categoryName') String? categoryName,
    @JsonKey(name: 'imagePath') String? imagePath,
    @JsonKey(name: 'isActive') bool? isActive,
  }) = _ProductCategoryRes;

  factory ProductCategoryRes.fromJson(Map<String, Object?> json) => _$ProductCategoryResFromJson(json);
}

