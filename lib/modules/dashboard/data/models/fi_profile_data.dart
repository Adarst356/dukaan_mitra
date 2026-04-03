import 'package:freezed_annotation/freezed_annotation.dart';

part 'fi_profile_data.freezed.dart';
part 'fi_profile_data.g.dart';

@freezed
abstract class FiProfileData with _$FiProfileData {
  const factory FiProfileData({
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'fullName') String? fullName,
    @JsonKey(name: 'mobileNumber') String? mobileNumber,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'state') String? state,
    @JsonKey(name: 'pincode') String? pincode,
    @JsonKey(name: 'isActive') bool? isActive,
    @JsonKey(name: 'createdDate') String? createdDate,
    @JsonKey(name: 'userTypeName') String? userTypeName,
    @JsonKey(name: 'documents') dynamic documents,
  }) = _FiProfileData;

  factory FiProfileData.fromJson(Map<String, Object?> json) => _$FiProfileDataFromJson(json);
}

