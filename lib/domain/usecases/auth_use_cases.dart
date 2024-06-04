import 'package:farm_scheduling/core/mediators/communication_types/AppStatus.dart';
import 'package:farm_scheduling/core/param/base_param.dart';
import 'package:farm_scheduling/core/param/no_param.dart';
import 'package:farm_scheduling/core/result/result.dart';
import 'package:farm_scheduling/core/usecases/base_use_case.dart';
import 'package:farm_scheduling/data/models/auth_model.dart';
import 'package:farm_scheduling/data/requests/auth_request.dart';
import 'package:farm_scheduling/domain/repositories/auth_repository.dart';
import 'package:flutter/material.dart';


import '../../core/error/base_error.dart';
import '../../core/request/request.dart';

class LoginUseCase
    extends UseCase<Future<Result<BaseError, bool>>, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<Result<BaseError, bool>> call(LoginParams params) {

    return authRepository.login(params.number);
  }
}



class ResendOtpUseCase
    extends UseCase<Future<Result<BaseError, bool>>, LoginParams> {
  final AuthRepository authRepository;

  ResendOtpUseCase({required this.authRepository});

  @override
  Future<Result<BaseError, bool>> call(LoginParams params) {

    return authRepository.resend(params.number);
  }
}



class VerifyOTPUseCase
    extends UseCase<Future<Result<BaseError,AuthModel >>, VerifyOTPParams> {
  final AuthRepository authRepository;

  VerifyOTPUseCase({required this.authRepository});

  @override
  Future<Result<BaseError, AuthModel>> call(VerifyOTPParams params) {
    return authRepository.verifyOTP(params.number, params.otpCode);
  }
}


class GetProfileUseCase
    extends UseCase<Future<Result<BaseError,AuthModel >>, GetProfileParams> {
  final AuthRepository authRepository;

  GetProfileUseCase({required this.authRepository});

  @override
  Future<Result<BaseError, AuthModel>> call(GetProfileParams params) {
    return authRepository.getProfile(params.getProfileRequest);
  }
}


class UpdateProfileUseCase
    extends UseCase<Future<Result<BaseError,AuthModel >>, UpdateProfileParams> {
  final AuthRepository authRepository;

  UpdateProfileUseCase({required this.authRepository});

  @override
  Future<Result<BaseError, AuthModel>> call(UpdateProfileParams params) {
    return authRepository.updateProfile(params.editProfileRequest);
  }
}



class LogoutUseCase
    extends UseCase<Future<bool>, NoParams> {
  final AuthRepository authRepository;

  LogoutUseCase({required this.authRepository});

  @override
  Future<bool> call(NoParams params) {
    // locator<FirebaseNotificationService>().deleteToken();
    return authRepository.logout();
  }
}

class CheckLoginStatusUseCase
    extends UseCase<Future<Status>, NoParams> {
  final AuthRepository authRepository;

  CheckLoginStatusUseCase({required this.authRepository});

  @override
  Future<Status> call(NoParams params) async {
    return (await authRepository.checkLoginStatus()) ? Status.authorized : Status.unauthorized;
  }
}

class LoginParams extends BaseParams {
  final String number;

  LoginParams({required this.number});
}



class VerifyOTPParams extends BaseParams {
  final String number;
  final String otpCode;

  VerifyOTPParams({required this.number, required this.otpCode});
}


class GetProfileParams extends BaseParams {
  GetProfileRequest getProfileRequest;

  GetProfileParams({required this.getProfileRequest});
}


class UpdateProfileParams extends BaseParams {
  EditProfileRequest editProfileRequest;

  UpdateProfileParams({required this.editProfileRequest});
}

// class RegisterFCMTokenParams extends BaseParams {
//   final String token;
//
//
//   RegisterFCMTokenParams({@required this.token});
// }
class RegisterFCMTokenRequest extends Request {
  final String token;

  RegisterFCMTokenRequest({
     required this.token,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "fcmToken": token,
    };
  }
}
