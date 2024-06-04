part of 'farm_bloc.dart';

enum AddFieldSatus { unset, success, error,loading }
enum UpdateFieldStatus { unset, success, error,loading}

//enum PageState { login, register,update, profile, profile2, profile3 }

@immutable
class FarmState extends Equatable {
  const FarmState(
      { this.addFieldStatus,this.error,this.cropId,this.cropSeedId,this.updateFieldStatus=UpdateFieldStatus.unset});

  final AddFieldSatus? addFieldStatus;
  final String? error;
  final int? cropId;
  final int? cropSeedId;
  final  UpdateFieldStatus? updateFieldStatus;




  FarmState copyWith(
      {AddFieldSatus? addFieldStatus,
        String? error,
        int? cropId,
        int? cropSeedId,
        UpdateFieldStatus? updateFieldStatus
   }) {
    return FarmState(
      addFieldStatus:addFieldStatus??this.addFieldStatus,
      error:error??this.error,
      cropId: cropId??this.cropId,
      cropSeedId: cropSeedId??this.cropSeedId,
      updateFieldStatus:updateFieldStatus??this.updateFieldStatus
      );
  }

  @override
  List<Object?> get props => [
    addFieldStatus,
    error,
    cropSeedId,
    updateFieldStatus
      ];
}


