import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
abstract class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'fullName') String? fullName,
    @JsonKey(name: 'mobileNumber') String? mobileNumber,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'state') String? state,
    @JsonKey(name: 'pincode') String? pincode,
    @JsonKey(name: 'isActive') bool? isActive,
    @JsonKey(name: 'isMobileVerified') bool? isMobileVerified,
    @JsonKey(name: 'createdDate') String? createdDate,
    @JsonKey(name: 'documents') List<Documents>? documents,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, Object?> json) => _$UserProfileModelFromJson(json);
}

@freezed
abstract class Documents with _$Documents {
  const factory Documents({
    @JsonKey(name: 'documentId') int? documentId,
    @JsonKey(name: 'documentName') String? documentName,
    @JsonKey(name: 'filePath') String? filePath,
    @JsonKey(name: 'verificationStatus') String? verificationStatus,
    @JsonKey(name: 'uploadedDate') String? uploadedDate,
  }) = _Documents;

  factory Documents.fromJson(Map<String, Object?> json) => _$DocumentsFromJson(json);
}

