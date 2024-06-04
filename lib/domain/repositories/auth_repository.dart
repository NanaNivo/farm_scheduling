

import 'package:farm_scheduling/core/repositories/repository.dart';
import 'package:farm_scheduling/core/result/result.dart';
import 'package:farm_scheduling/data/models/auth_model.dart';
import 'package:farm_scheduling/data/requests/auth_request.dart';

import '../../core/error/base_error.dart';

import '../usecases/auth_use_cases.dart';

abstract class AuthRepository extends Repository {
  Future<Result<BaseError, bool>> login(String number);
  Future<Result<BaseError, bool>> resend(String number);

 // Future<Result<BaseError, bool>> register(RegisterRequest registerRequest);
//  Future<Result<BaseError, bool>> setProfile(CompleteProfileRequest completeProfileRequest);
  Future<Result<BaseError, bool>> registerFCMToken(RegisterFCMTokenRequest registerFCMTokenRequest);


  Future<Result<BaseError, AuthModel>> verifyOTP(String number, String otpCode);

  Future<bool> logout();

  Future<bool> checkLoginStatus();
  Future<Result<BaseError,AuthModel>> getProfile(GetProfileRequest getProfileRequest);
  Future<Result<BaseError, AuthModel>> updateProfile(EditProfileRequest editProfileRequest);
}

