import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:farm_scheduling/core/mediators/bloc_hub/bloc_member.dart';
import 'package:farm_scheduling/core/mediators/communication_types/base_communication.dart';
import 'package:farm_scheduling/data/requests/auth_request.dart';
import 'package:farm_scheduling/domain/usecases/auth_use_cases.dart';
import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/auth_model.dart';



part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with BlocMember {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final VerifyOTPUseCase verifyOTPUseCase;
  final GetProfileUseCase getProfileUseCase;
 final UpdateProfileUseCase updateProfileUseCase;


  AuthBloc(
      {required this.loginUseCase,
      required this.verifyOTPUseCase,
        required this.logoutUseCase,
        required this.getProfileUseCase,required this.updateProfileUseCase
     })
      : super(const AuthState()) {

    on<SetNumberEvent>(_onSetNumber);
    on<SendOTPCodeEvent>(_onSendOtpCode);
    on<GetProfileEvent>(_onGetProfile);
    on<UpdateProfileEvent>(_onUpdateProfileEvent);
  }

  @override
  void receive(String from, CommunicationType data) {
    // TODO: implement receive
  }
}

extension AuthBlocMappers on AuthBloc {
  Future<void> _onSetNumber(SetNumberEvent event, Emitter<AuthState> emit) async {
    print('event.number: ${event.number}');
    emit(state.copyWith(loginState: AuthStatusType.loading));
    final result=await loginUseCase(LoginParams(number: event.number));
    if(result.hasDataOnly)
      {
        emit(state.copyWith(loginState: AuthStatusType.success,number: event.number));
      }
    else{
      emit(state.copyWith(loginState: AuthStatusType.error,errorMassege: result.error.toString()));
    }
   // validateNumber(AuthValidationType.number);
  }

  void _onSendOtpCode(SendOTPCodeEvent event, Emitter<AuthState> emit) async{
    emit(state.copyWith(verifyState: AuthStatusType.loading));
      final result=await verifyOTPUseCase(VerifyOTPParams(number: state.number, otpCode: event.otpCode));
      if(result.hasDataOnly)
        {
          emit(state.copyWith(verifyState: AuthStatusType.success));
        }
      else
      {
        emit(state.copyWith(verifyState: AuthStatusType.error,errorMassege: result.error.toString()));
      }

  }
  void _onGetProfile(GetProfileEvent event,Emitter<AuthState> emit) async{
    final result=await getProfileUseCase(GetProfileParams(getProfileRequest: GetProfileRequest()));
    if(result.hasDataOnly)
    {
      emit(state.copyWith(profileState: ProfileState.success,user: result.data?.data?.user));
    }
    else
    {
      emit(state.copyWith(profileState: ProfileState.error,errorMassege: result.error.toString()));
    }
  }
  // void _onResendOtp(ResendOtpEvent event, Emitter<AuthState> emit) async {
  //   final result = await locator<ResendOtpUseCase>()(LoginParams(number: state.number));
  //
  //   if (result.hasDataOnly) {
  //     emit(state.copyWith(resendOtpStatus: AuthStatusType.success, resendOtpResult: "تم ارسال الرمز بنجاح."));
  //   } else {
  //     emit(state.copyWith(resendOtpStatus: AuthStatusType.error, resendOtpResult: 'يرجى المحاولة لاحقاً'));
  //   }
  //   await Future.delayed(const Duration(milliseconds: 300));
  //   emit(state.copyWith(resendOtpStatus: AuthStatusType.unset, resendOtpResult: ''));
  //
  // }

  // void _onSubmitLogin(SubmitNumberEvent event, Emitter<AuthState> emit) async {
  //  // if(state.registerStatus!=AuthStatusType.update) {
  //   print("_onSubmitLogin");
  //     switch (state.pageState) {
  //       case PageState.login:
  //         if (state.isValidNumber) {
  //           emit(state.copyWith(loginState: AuthStatusType.loading));
  //           print(
  //             'state.numberstate.number: ${state.number}',
  //           );
  //           final result = await loginUseCase(
  //               LoginParams(number: state.number));
  //           if (result.hasDataOnly) {
  //             emit(state.copyWith(
  //               loginState: AuthStatusType.success,
  //             ));
  //           } else if (result.hasErrorOnly) {
  //             emit(state.copyWith(
  //                 loginState: AuthStatusType.error,
  //                 loginErrorMessage: result.error.toString()));
  //           }
  //         } else {
  //           emit(state.copyWith(
  //               loginState: AuthStatusType.error,
  //               loginErrorMessage: "Validation error on number"));
  //         }
  //         break;
  //
  //       case PageState.register:
  //         emit(state.copyWith(registerStatus: AuthStatusType.loading));
  //
  //         print(
  //             'state.isValidRegisterData111: ${state
  //                 .isValidRegisterData} sdsd: ${state.registerState
  //                 .nationality}');
  //         if (state.isValidRegisterData) {
  //           final result = await registerUseCase(RegisterParams(
  //               registerRequest: RegisterRequest(
  //                   gender: state?.registerState?.gender,
  //                   email: state?.registerState?.email,
  //                   fatherName: state?.registerState?.fatherName,
  //                   beneficiaryUser: int.tryParse(
  //                       state?.registerState?.nationality),
  //                   dateOfBirth: state?.registerState?.date,
  //                   facebookProfile: state?.registerState?.facebook,
  //                   fullNameEn: state?.registerState?.nameEn + ' ' +
  //                       state?.registerState?.lastName,
  //                   phoneNumber: state?.number)));
  //           if (result.hasDataOnly) {
  //             emit(state.copyWith(registerStatus: AuthStatusType.success));
  //           } else {
  //             emit(state.copyWith(
  //                 registerStatus: AuthStatusType.error,
  //                 registerErrorMessage: result.error.toString()));
  //           }
  //         }
  //         else {
  //           emit(state.copyWith(
  //               registerStatus: AuthStatusType.error,
  //               registerErrorMessage: "validation Error!"));
  //         }
  //         break;
  //       case PageState.profile:
  //       case PageState.profile2:
  //         emit(state.copyWith(profileFirstStatus: AuthStatusType.loading));
  //
  //         print('profileprofileprofile:: ${state.userInfoState
  //             .selectedUniversity}');
  //         final result = await setProfileDataUseCase(ProfileParams(
  //             profileRequest: CompleteProfileRequest(
  //                 avatar: state.updateProfileState.avatar,
  //                 fullNameAr: state.updateProfileState.nameAr,
  //                 fullNameEn: state.updateProfileState.nameEn,
  //                 fatherName: state.updateProfileState.fatherName,
  //                 dateOfBirth: state.updateProfileState.date,
  //                 gender: state.updateProfileState.gender,
  //                 nationality: state.updateProfileState.nationality,
  //                 email: state.updateProfileState.email,
  //                 facebookProfile: state.updateProfileState.facebook,
  //                 phoneNumber: state.number,
  //                 disabilitiesDetails: state.userInfoState.disabilitiesDetails,
  //                 governorate: state.userInfoState.governorate,
  //                 workDetails: state.userInfoState.workDetails,
  //                 academicYear: state.userInfoState.selectedAcademicYear,
  //                 highEducationLevel: state.userInfoState
  //                     .selectedHighestEducationLevel,
  //                 highSchoolLevel: state.userInfoState
  //                     .selectedHighSchoolTypeLevel,
  //                 faculty: state.userInfoState.selectedUniversityFaculty,
  //                 university: state.userInfoState.selectedUniversity,
  //                 universityType: state.userInfoState.selectedUniversityType,
  //                 previousActivities: state.userInfoState.previousActivities,
  //                 displaceDetails: state.userInfoState.displaceDetails,
  //                 address: state.userInfoState.address)));
  //         if (result.hasDataOnly) {
  //           emit(state.copyWith(profileFirstStatus: AuthStatusType.success));
  //         } else {
  //           emit(state.copyWith(profileFirstStatus: AuthStatusType.error));
  //         }
  //         break;
  //       case PageState.profile3:
  //         emit(state.copyWith(profileStatus: AuthStatusType.loading));
  //
  //         print('profileprofileprofile:: ${state.updateProfileState.gender}');
  //         final result = await setProfileDataUseCase(ProfileParams(
  //             profileRequest: CompleteProfileRequest(
  //                 avatar: state.updateProfileState.avatar,
  //                 fullNameAr: state.updateProfileState.nameAr,
  //                 fullNameEn: state.updateProfileState.nameEn,
  //                 fatherName: state.updateProfileState.fatherName,
  //                 dateOfBirth: state.updateProfileState.date,
  //                 gender: state.updateProfileState.gender,
  //                 nationality: state.updateProfileState.nationality,
  //                 email: state.updateProfileState.email,
  //                 facebookProfile: state.updateProfileState.facebook,
  //                 phoneNumber: state.number,
  //                 disabilitiesDetails: state.userInfoState.disabilitiesDetails,
  //                 governorate: state.userInfoState.governorate,
  //                 workDetails: state.userInfoState.workDetails,
  //                 previousActivities: state.userInfoState.previousActivities,
  //                 displaceDetails: state.userInfoState.displaceDetails,
  //                 academicYear: state.userInfoState.selectedAcademicYear,
  //                 highEducationLevel: state.userInfoState
  //                     .selectedHighestEducationLevel,
  //                 highSchoolLevel: state.userInfoState
  //                     .selectedHighSchoolTypeLevel,
  //                 faculty: state.userInfoState.selectedUniversityFaculty,
  //                 university: state.userInfoState.selectedUniversity,
  //                 universityType: state.userInfoState.selectedUniversityType,
  //                 address: state.userInfoState.address)));
  //         if (result.hasDataOnly) {
  //           emit(state.copyWith(profileStatus: AuthStatusType.success));
  //         } else {
  //           emit(state.copyWith(profileStatus: AuthStatusType.error));
  //         }
  //
  //         break;
  //
  //       case PageState.update:
  //           final result = await setProfileDataUseCase(ProfileParams(
  //               profileRequest: CompleteProfileRequest(
  //
  //                   phoneNumber: state.number,
  //                 )));
  //           print("result${result.hasDataOnly}");
  //         if(result.hasDataOnly) {
  //
  //           final result2 = await loginUseCase(
  //               LoginParams(number: state.number));
  //           print("result2${result2.hasDataOnly}");
  //           if(result2.hasDataOnly)
  //             {
  //               emit(state.copyWith(registerStatus: AuthStatusType.success ));
  //             }
  //           else
  //             {
  //               emit(state.copyWith(
  //                   registerStatus: AuthStatusType.error,
  //                   registerErrorMessage: result.error.toString()));
  //             // locator<AuthBloc>().setPageType(PageState.update);
  //             }
  //
  //         }
  //         else {
  //           emit(state.copyWith(
  //               registerStatus: AuthStatusType.error,
  //               registerErrorMessage: result.error.toString()));
  //       //    locator<AuthBloc>().setPageType(PageState.update);
  //         }
  //           break;
  //     }
  //
  //   // else{
  //   //
  //   //   emit(state.copyWith(registerStatus: AuthStatusType.success));
  //   // }
  // }

  // void _onAddPhoneNumber(addPhoneNumber event,Emitter<AuthState> emit) async
  // {
  //   emit(state.copyWith(phoneDefault: true));
  // }
  //
  // void _onUpdateProfileCase(UpdateProfileCase event,Emitter<AuthState> emit) async
  // {
  //   emit(state.copyWith(registerStatus: AuthStatusType.update,loginState:AuthStatusType.update ));
  // }

  // void _onSubmitOTPCode(SubmitOtpVerificationCodeEvent event, Emitter<AuthState> emit) async {
  //   print('state.isValidOtp: ${state.isValidOtp}');
  //   if (state.isValidOtp) {
  //     emit(state.copyWith(
  //       verifyState: AuthStatusType.loading,
  //     ));
  //     final result =
  //         await verifyOTPUseCase(VerifyOTPParams(number: state.number, otpCode: state.otpCode));
  //
  //     if (result.hasDataOnly) {
  //       Result<BaseError, UserModel> userModel;
  //       userModel = await locator<GetProfileUseCase>()(NoParams());
  //
  //       emit(state.copyWith(verifyState: AuthStatusType.success));
  //
  //       sendTo(AppStatus(data: Status.authorized, user: userModel.data), MembersKeys.appBloc);
  //     } else if (result.hasErrorOnly) {
  //       print('result.error.toString(): ${result.error.toString()}');
  //       emit(state.copyWith(
  //         verifyState: AuthStatusType.error,
  //         otpErrorMessage: result.error.toString(),
  //       ));
  //     }
  //   } else {
  //     emit(state.copyWith(
  //         verifyState: AuthStatusType.error, otpErrorMessage: "Validation error on otp code"));
  //   }
  // }








  // void _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
  //   final result = await logoutUseCase(NoParams());
  //   emit(AuthState());
  //   if (result) {
  //     sendTo(AppStatus(data: Status.unauthorized), MembersKeys.appBloc);
  //   }
  // }

void _onUpdateProfileEvent(UpdateProfileEvent event,Emitter<AuthState> emit) async{
  final result=await updateProfileUseCase(UpdateProfileParams(editProfileRequest: EditProfileRequest(avatar: event.avatar,fullName: event.fullName,address: event.address)));
  if(result.hasDataOnly)
  {
    emit(state.copyWith(updateStatus: UpdateStatus.success,user: result.data?.data?.user));
  }
  else
  {
    emit(state.copyWith(updateStatus: UpdateStatus.error,errorMassege: result.error.toString()));
  }
}
}

extension AuthBlocActions on AuthBloc {
  void setNumber(String number) {
    add(SetNumberEvent(number));
  }

  void setOtpCode(String otpCode) {
    add(SendOTPCodeEvent(otpCode));
  }

  void submitNumberEvent() {
    add(SubmitNumberEvent());
  }

  void resendOtp() {
    add(ResendOtpEvent());
  }

  void submitOTPCode() {
    add(SubmitOtpVerificationCodeEvent());
  }

  void getOptions() {
    add(GetOptionsEvent());
  }

  void completeOptions(String type) {
    add(CompleteOptionsEvent(type));
  }

  void changeOptions(String type) {
    add(ChangeOptionsEvent(type));
  }

  void validateNumber(AuthValidationType validationType) {
    add(ValidateEvent(validationType));
  }

  void resetLogin() {
    add(ResetLoginStatusEvent());
  }

  void resetFirstProfile() {
    add(ResetFirstProfileEvent());
  }

  void resetProfile() {
    add(ResetProfileEvent());
  }

  void resetOtp() {
    add(ResetOtpCodeStatusEvent());
  }

  void resetOtpState() {
    add(ResetOtpStateEvent());
  }

  void resetRegisterErrorState() {
    add(ResetOtpStateEvent());
  }

  void setPageType(PageState pageState) {
    add(SetPageTypeEvent(pageState));
  }

  void logout() {
    add(LogoutEvent());
  }
}
