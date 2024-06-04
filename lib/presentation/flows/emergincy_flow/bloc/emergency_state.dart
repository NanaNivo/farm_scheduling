part of 'emergency_bloc.dart';

enum EmergencyStatus { unset, success, error, loading }

enum AddEmergencyStatus {
  unset,
  success,
  error,
}

//enum PageState { login, register,update, profile, profile2, profile3 }

@immutable
class EmergencyState extends Equatable {
  const EmergencyState(
      {this.emergencyStatus,
      this.emergencyList,
      this.addemergencyStatus,
      this.fieldId,
      this.valueEmergencyType});

  final EmergencyStatus? emergencyStatus;
  final EmergencyTypeModel? emergencyList;
  final AddEmergencyStatus? addemergencyStatus;
  final int? fieldId;
  final String? valueEmergencyType;

  EmergencyState copyWith(
      {EmergencyStatus? emergencyStatus,
      EmergencyTypeModel? emergencyList,
      AddEmergencyStatus? addemergencyStatus,
      int? fieldId,
      String? valueEmergencyType}) {
    return EmergencyState(
        emergencyStatus: emergencyStatus ?? this.emergencyStatus,
        emergencyList: emergencyList ?? this.emergencyList,
        addemergencyStatus: addemergencyStatus,
        fieldId: fieldId ??this.fieldId,
        valueEmergencyType: valueEmergencyType ?? this.valueEmergencyType);
  }

  @override
  List<Object?> get props =>
      [emergencyStatus, emergencyList, addemergencyStatus, fieldId,valueEmergencyType];
}
