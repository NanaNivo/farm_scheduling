part of 'farm_bloc.dart';

enum AuthValidationType { number, otpCode, register }

@immutable
abstract class FarmEvent {}

class AddFieldEvent extends FarmEvent
{
  int? numberDenim;
  int? farmId;

  AddFieldEvent({required this.numberDenim,required this.farmId});
}

class SetFieldEvent extends FarmEvent
{
  int? cropId;
  int? cropSeedId;
  SetFieldEvent({ this.cropId, this.cropSeedId});
}
class UpdateStatusField extends FarmEvent
{
  int taskStatus;
  int idField;
  UpdateStatusField({required this.taskStatus,required this.idField});
}








