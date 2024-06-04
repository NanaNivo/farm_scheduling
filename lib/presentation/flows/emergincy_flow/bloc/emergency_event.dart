part of 'emergency_bloc.dart';

enum AuthValidationType { number, otpCode, register }

@immutable
abstract class EmergencyEvent {}

class GetEmergencyTypeEvent extends EmergencyEvent
{
  GetEmergencyTypeEvent();
}
class AddEmergencyEvent extends EmergencyEvent
{
  final String title;
  final String note;
  final int? farmId;
  final int? fieldId;
  final String? type;
  AddEmergencyEvent({required this.title,required this.note,this.farmId,this.fieldId,this.type});
}
class AddFieldId extends EmergencyEvent
{
  int fieldId;
  AddFieldId({required this.fieldId});

}

class EmergencyTypeEvent extends EmergencyEvent
{
  String  value;
  EmergencyTypeEvent({required this.value});

}











