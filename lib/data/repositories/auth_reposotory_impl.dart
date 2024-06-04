import 'package:dartz/dartz.dart';
import 'package:farm_scheduling/core/error/base_error.dart';
import 'package:farm_scheduling/core/result/result.dart';
import 'package:farm_scheduling/data/datasources/auth_data_source/auth_data_source.dart';
import 'package:farm_scheduling/data/models/auth_model.dart';



import 'package:farm_scheduling/data/requests/auth_request.dart';
import 'package:farm_scheduling/domain/repositories/auth_repository.dart';
import 'package:farm_scheduling/domain/usecases/auth_use_cases.dart';
import 'package:farm_scheduling/presentation/flows/auth_flow/blocs/auth_bloc.dart';


import '../../core/services/session_manager.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource authDataSource;
  final SessionManager sessionManager;


  AuthRepositoryImpl({required this.authDataSource, required this.sessionManager});

  @override
  Future<Result<BaseError, bool>> login(String number) async {
    final result = await authDataSource.loginSource(SendMobileRequest(number));

    return executeWithoutConvert(remoteResult: result);
  }

  @override
  Future<bool> checkLoginStatus() {
    // TODO: implement checkLoginStatus
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Result<BaseError, bool>> registerFCMToken(RegisterFCMTokenRequest registerFCMTokenRequest) {
    // TODO: implement registerFCMToken
    throw UnimplementedError();
  }

  @override
  Future<Result<BaseError, bool>> resend(String number) {
    // TODO: implement resend
    throw UnimplementedError();
  }

  @override
  Future<Result<BaseError, AuthModel>> verifyOTP(String number, String otpCode) async {
    final result = await authDataSource.SendCode(SendCodeRequest(number,otpCode));
    if (result.isRight()) {
      final data = (result as Right<BaseError, AuthModel?>).value;
      print("token: ${data!.data!.token}");
    await  sessionManager.persistToken(data.data!.token!);
    }
    return executeWithoutConvert(remoteResult: result);
  }

  @override
  Future<Result<BaseError, AuthModel>> getProfile(GetProfileRequest getProfileRequest) async {
    final result = await authDataSource.getProfile(getProfileRequest);
    // if (result.isRight()) {
    //   final data = (result as Right<BaseError, AuthModel?>).value;
    //   print("token: ${data!.data!.token}");
    //   await  sessionManager.persistToken(data.data!.token!);
    // }
    return executeWithoutConvert(remoteResult: result);
  }


  @override
  Future<Result<BaseError, AuthModel>> updateProfile(EditProfileRequest editProfileRequest) async {
    final result = await authDataSource.editProfileSourse(editProfileRequest);
    // if (result.isRight()) {
    //   final data = (result as Right<BaseError, AuthModel?>).value;
    //   print("token: ${data!.data!.token}");
    //   await  sessionManager.persistToken(data.data!.token!);
    // }
    return executeWithoutConvert(remoteResult: result);
  }
}




// class AuthRepositoryImpl extends AuthRepository {
//   final AuthDataSource authDataSource;
//   final SessionManager sessionManager;
//
//   AuthRepositoryImpl(this.authDataSource, this.sessionManager);
//
//   // @override
//   // Future<Result<BaseError, InitModel>> setMobileId(SetMobileIdRequest setMobileIdRequest) async {
//   //   final result = await authDataSource.setMobileId(setMobileIdRequest);
//   //   if (result.isRight()) {
//   //     final data = (result as Right<BaseError, InitModel?>).value;
//   //     print("token: ${data!.content!.token!}");
//   //     sessionManager.persistToken(data.content!.token!);
//   //   }
//   //   return executeWithoutConvert(remoteResult: result);
//   // }
//   //
//   // @override
//   // Future<Result<BaseError, List<CurrencyModel>?>> getCurrencies() async {
//   //   final result = await authDataSource.getCurrencies();
//   //       return executeWithoutConvert(remoteResult: result);
//   // }
//
//   // Future<Result<BaseError, InitModel>> registerRepo(RegisterRequest registerRequest) async {
//   //   final result = await authDataSource.registerSource(registerRequest);
//   //   if (result.isRight()) {
//   //     final data = (result as Right<BaseError, InitModel?>).value;
//   //     print("token: ${data!.content!.token!}");
//   //     sessionManager.persistToken(data.content!.token!);
//   //   }
//   //   return executeWithoutConvert(remoteResult: result);
//   // }
//
//   // @override
//   // Future<Result<BaseError, String?>> changeCurrency(ChangeCurrencyRequest changeCurrencyRequest) async{
//   //   final result = await authDataSource.changeCurrency(changeCurrencyRequest);
//   //       return executeWithoutConvert(remoteResult: result);
//   //
//   // }
//   //
//   //
//   // @override
//   // Future<Result<BaseError, InitModel>> editProfileRepo(EditProfileRequest editProfile) async {
//   //   final result = await authDataSource.editProfileSourse(editProfile);
//   //   if (result.isRight()) {
//   //     final data = (result as Right<BaseError, InitModel?>).value;
//   //     print("token: ${data!.content!.token!}");
//   //     sessionManager.persistToken(data.content!.token!);
//   //   }
//   //   return executeWithoutConvert(remoteResult: result);
//   // }
//   //
//   // @override
//   // Future<Result<BaseError, InitModel>> loginRepo(LoginRequest loginRequest) async {
//   //   final result = await authDataSource.loginSource(loginRequest);
//   //   if (result.isRight()) {
//   //     final data = (result as Right<BaseError, InitModel?>).value;
//   //     print("token: ${data!.content!.token!}");
//   //     sessionManager.persistToken(data.content!.token!);
//   //   }
//   //   return executeWithoutConvert(remoteResult: result);
//   // }
//   //
//   // @override
//   // Future<Result<BaseError, InitModel>> resetPasswordConfirmRepo(ResetPasswordConfirmRequest resetPasswordConfirmRequest) async {
//   //   final result = await authDataSource.resetPasswordConfirmSource(resetPasswordConfirmRequest);
//   //   if (result.isRight()) {
//   //     final data = (result as Right<BaseError, InitModel?>).value;
//   //     // print("token: ${data!.content!.token!}");
//   //     // sessionManager.persistToken(data.content!.token!);
//   //   }
//   //   return executeWithoutConvert(remoteResult: result);
//   // }
//   //
//   // @override
//   // Future<Result<BaseError, InitModel>> resetPasswordRepo(ResetPasswordRequest resetPasswordRequest) async {
//   //   final result = await authDataSource.resetPasswordSource(resetPasswordRequest);
//   //   if (result.isRight()) {
//   //     final data = (result as Right<BaseError, InitModel?>).value;
//   //     // print("token: ${data!.content!.token!}");
//   //     // sessionManager.persistToken(data.content!.token!);
//   //   }
//   //   return executeWithoutConvert(remoteResult: result);
//   // }
//   //
//   // @override
//   // Future<Result<BaseError, InitModel>> accessTokenSocial(AccessTokenSocialRequest accessTokenSocialRequest) async {
//   //    final result= await authDataSource.accessTokenSource(accessTokenSocialRequest);
//   //    if (result.isRight()) {
//   //      final data = (result as Right<BaseError, InitModel?>).value;
//   //      print("token: in storage${data!.content!.token!}");
//   //      sessionManager.persistToken(data.content!.token!);
//   //    }
//   //    return  executeWithoutConvert(remoteResult: result);
//   //
//   // }
// }


