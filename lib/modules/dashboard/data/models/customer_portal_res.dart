import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_portal_res.freezed.dart';
part 'customer_portal_res.g.dart';

@freezed
abstract class CustomerPortalRes with _$CustomerPortalRes {
  const factory CustomerPortalRes({
    @JsonKey(name: 'loanId') int? loanId,
    @JsonKey(name: 'productName') String? productName,
    @JsonKey(name: 'productImage') List<ProductImage>? productImage,
    @JsonKey(name: 'loanAmount') int? loanAmount,
    @JsonKey(name: 'duration') dynamic duration,
    @JsonKey(name: 'durationType') dynamic durationType,
    @JsonKey(name: 'appliedDate') String? appliedDate,
    @JsonKey(name: 'loanStatus') String? loanStatus,
    @JsonKey(name: 'loanStatusId') int? loanStatusId,
    @JsonKey(name: 'totalPaid') dynamic totalPaid,
    @JsonKey(name: 'outstandingAmount') dynamic outstandingAmount,
    @JsonKey(name: 'nextDueDate') dynamic nextDueDate,
  }) = _CustomerPortalRes;

  factory CustomerPortalRes.fromJson(Map<String, Object?> json) => _$CustomerPortalResFromJson(json);
}

@freezed
abstract class ProductImage with _$ProductImage {
  const factory ProductImage({
    @JsonKey(name: 'productImageId') int? productImageId,
    @JsonKey(name: 'productId') int? productId,
    @JsonKey(name: 'imagePath') String? imagePath,
  }) = _ProductImage;

  factory ProductImage.fromJson(Map<String, Object?> json) => _$ProductImageFromJson(json);
}

