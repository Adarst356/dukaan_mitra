import 'package:freezed_annotation/freezed_annotation.dart';

part 'fi_assignment_model.freezed.dart';
part 'fi_assignment_model.g.dart';

@freezed
abstract class FiAssignmentModel with _$FiAssignmentModel {
  const factory FiAssignmentModel({
    @JsonKey(name: 'assignmentId') int? assignmentId,
    @JsonKey(name: 'loanId') int? loanId,
    @JsonKey(name: 'assignedDate') String? assignedDate,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'customerName') String? customerName,
    @JsonKey(name: 'mobileNumber') String? mobileNumber,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'productName') String? productName,
    @JsonKey(name: 'mrp') int? mrp,
  }) = _FiAssignmentModel;

  factory FiAssignmentModel.fromJson(Map<String, Object?> json) => _$FiAssignmentModelFromJson(json);
}

