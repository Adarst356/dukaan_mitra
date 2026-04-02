import 'package:freezed_annotation/freezed_annotation.dart';

part 'fi_dashboard_data.freezed.dart';
part 'fi_dashboard_data.g.dart';

@freezed
abstract class FiDashboardData with _$FiDashboardData {
  const factory FiDashboardData({
    @JsonKey(name: 'totalAssignments') int? totalAssignments,
    @JsonKey(name: 'completedReports') int? completedReports,
    @JsonKey(name: 'pendingInspections') int? pendingInspections,
  }) = _FiDashboardData;

  factory FiDashboardData.fromJson(Map<String, Object?> json) => _$FiDashboardDataFromJson(json);
}

