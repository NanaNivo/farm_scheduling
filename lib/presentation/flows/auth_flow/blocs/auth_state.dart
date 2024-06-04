part of 'auth_bloc.dart';

enum AuthStatusType { unset, success,update, error, loading, fetched }

enum PageState { login, register,update, profile, profile2, profile3 }
enum ProfileState { unset, success,update, error, loading,}
enum UpdateStatus  {unset,success,update,error,loading}

@immutable
class AuthState extends Equatable {
  const AuthState(
      {this.loginState = AuthStatusType.unset,
      this.verifyState = AuthStatusType.unset, this.errorMassege='',this.number='', this.user,this.profileState=ProfileState.unset, this.updateStatus=UpdateStatus.unset});

  final AuthStatusType loginState;

  final AuthStatusType verifyState;

  final String errorMassege;
  final String number;
  final User? user;
  final ProfileState profileState;
  final UpdateStatus updateStatus;


  AuthState copyWith(
      {AuthStatusType? loginState,
      AuthStatusType? verifyState,
        String? errorMassege,
        String? number,
        User? user,
        ProfileState? profileState,
        UpdateStatus? updateStatus
   }) {
    return AuthState(
        loginState: loginState ??AuthStatusType.unset,
        verifyState: verifyState ??AuthStatusType.unset,
      errorMassege:errorMassege ?? '',
      number: number??this.number,
      user:user??this.user,
      profileState: profileState??this.profileState,
      updateStatus: updateStatus??this.updateStatus
      );
  }

  @override
  List<Object?> get props => [

        loginState,
        verifyState,
    errorMassege,
    number,
    user,
    profileState,
    updateStatus
      ];
}


