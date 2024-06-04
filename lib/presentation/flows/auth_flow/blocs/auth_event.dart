part of 'auth_bloc.dart';

enum AuthValidationType { number, otpCode, register }

@immutable
abstract class AuthEvent {}

class SetNumberEvent extends AuthEvent {
  final String number;

  SetNumberEvent(this.number);
}

class SendOTPCodeEvent extends AuthEvent {
  final String otpCode;

  SendOTPCodeEvent(this.otpCode);
}

class SetPageTypeEvent extends AuthEvent {
  final PageState pageState;

  SetPageTypeEvent(this.pageState);
}
class GetProfileEvent extends AuthEvent
{

}
class UpdateProfileEvent extends AuthEvent
{
 String? avatar;
 String? fullName;
 String? address;
 UpdateProfileEvent({this.address,this.avatar,this.fullName});
}






class SubmitNumberEvent extends AuthEvent {

}

class SubmitOtpVerificationCodeEvent extends AuthEvent {}

class ValidateEvent extends AuthEvent {
  final AuthValidationType validationType;

  ValidateEvent(this.validationType);
}

class ResetLoginStatusEvent extends AuthEvent {}
class ResendOtpEvent extends AuthEvent {}

class GetOptionsEvent extends AuthEvent {}

class CompleteOptionsEvent extends AuthEvent {
  final String type;

  CompleteOptionsEvent(this.type);
}
class FitchGovernorate extends AuthEvent
{

}
class ChangeOptionsEvent extends AuthEvent {
  final String type;

  ChangeOptionsEvent(this.type);
}

class ResetOtpCodeStatusEvent extends AuthEvent {}

class ResetOtpStateEvent extends AuthEvent {}
class ResetRegisterErrorEvent extends AuthEvent {}
class ResetFirstProfileEvent extends AuthEvent {}
class ResetProfileEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

class UpdateProfileCase extends AuthEvent
{

}
class addPhoneNumber extends AuthEvent
{

}
