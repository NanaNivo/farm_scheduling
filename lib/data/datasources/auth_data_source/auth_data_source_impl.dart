import 'package:dartz/dartz.dart';
import 'package:farm_scheduling/core/datasources/api_call_params.dart';
import 'package:farm_scheduling/core/datasources/function_instance.dart';
import 'package:farm_scheduling/core/enums/api/HttpMethod.dart';
import 'package:farm_scheduling/core/resources/apis.dart';
import 'package:farm_scheduling/data/models/auth_model.dart';

import 'package:farm_scheduling/data/responses/auth_response.dart';

import '../../../core/error/base_error.dart';

import '../../requests/auth_request.dart';

import 'auth_data_source.dart';

class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<Either<BaseError, bool>> loginSource(SendMobileRequest loginRequest) {
      return request<bool, LoginResponse>(
          ApiCallParams<LoginResponse>(
              responseStr: "LoginResponse",
              mapper: (json) => LoginResponse.fromJson(json),
              method: HttpMethod.POST,
              data:loginRequest.toJson() ,
              url: ApiUrls.login));
    }

  @override
  Future<Either<BaseError, AuthModel>> SendCode(SendCodeRequest sendCodeRequest) {
    return request<AuthModel, SenCodeResponse>(
        ApiCallParams<SenCodeResponse>(
            responseStr: "SenCodeResponse",
            mapper: (json) => SenCodeResponse.fromJson(json),
            method: HttpMethod.POST,
            data:sendCodeRequest.toJson() ,
            url: ApiUrls.verifyPhone));
  }

  @override
  Future<Either<BaseError, AuthModel>> getProfile(GetProfileRequest getProfileRequest) {
    return request<AuthModel,GetProfileResponse >(
        ApiCallParams<GetProfileResponse>(
            responseStr: "GetProfileResponse",
            mapper: (json) => GetProfileResponse.fromJson(json),
            method: HttpMethod.GET,
            data:getProfileRequest.toJson() ,
            url: ApiUrls.getProfile));
  }

  @override
  Future<Either<BaseError, AuthModel>> editProfileSourse(EditProfileRequest editProfileRequest) {
    return request<AuthModel,UpdateProfileResponse >(
        ApiCallParams<UpdateProfileResponse>(
            responseStr: "UpdateProfileResponse",
            mapper: (json) => UpdateProfileResponse.fromJson(json),
            method: HttpMethod.POST,
            data:editProfileRequest.toJson() ,
            url: ApiUrls.updateProfile));
  }
  // @override
  // Future<Either<BaseError, InitModel>> setMobileId(SetMobileIdRequest setMobileIdRequest) {
  //   return request<InitModel, SetMobileIdResponse>(ApiCallParams<SetMobileIdResponse>(
  //       responseStr: "SetMobileIdResponse",
  //       mapper: (json) => SetMobileIdResponse.fromJson(json),
  //       data: setMobileIdRequest.toJson(),
  //       method: HttpMethod.POST,
  //       url: ApiUrls.setAppInfo));
  // }
  //
  // @override
  // Future<Either<BaseError, List<CurrencyModel>?>> getCurrencies() {
  //   return request<List<CurrencyModel>?, GetCurrenciesResponse>(
  //       ApiCallParams<GetCurrenciesResponse>(
  //           responseStr: "GetCurrenciesResponse",
  //           mapper: (json) => GetCurrenciesResponse.fromJson(json),
  //           method: HttpMethod.GET,
  //           url: ApiUrls.getCurrencies));
  // }
  //
  // @override
  // Future<Either<BaseError, String?>> changeCurrency(ChangeCurrencyRequest changeCurrencyRequest) {
  //   return request<String?, ChangeCurrencyResponse>(
  //       ApiCallParams<ChangeCurrencyResponse>(
  //           responseStr: "ChangeCurrencyResponse",
  //           mapper: (json) => ChangeCurrencyResponse.fromJson(json),
  //           data: changeCurrencyRequest.toJson(),
  //           method: HttpMethod.POST,
  //           url: ApiUrls.changeCurrency));
  // }
  // Future<Either<BaseError, InitModel>> registerSource(RegisterRequest registerRequest) {
  //   return request<InitModel, RegisterResponse>(ApiCallParams<RegisterResponse>(
  //       responseStr: "RegisterResponse",
  //       mapper: (json) => RegisterResponse.fromJson(json),
  //       data: registerRequest.toJson(),
  //       method: HttpMethod.POST,
  //       url: ApiUrls.setAppInfo));
  // }



  // @override
  // Future<Either<BaseError, InitModel>> editProfileSourse(EditProfileRequest editProfileRequest) {
  //   return request<InitModel, RegisterResponse>(ApiCallParams<RegisterResponse>(
  //       responseStr: "RegisterResponse",
  //       mapper: (json) => RegisterResponse.fromJson(json),
  //       data: editProfileRequest.toJson(),
  //       method: HttpMethod.POST,
  //       url: ApiUrls.editProfile));
  // }
  //
  // @override
  // Future<Either<BaseError, InitModel>> loginSource(LoginRequest loginRequest) {
  //   return request<InitModel, RegisterResponse>(ApiCallParams<RegisterResponse>(
  //       responseStr: "RegisterResponse",
  //       mapper: (json) => RegisterResponse.fromJson(json),
  //       data: loginRequest.toJson(),
  //       method: HttpMethod.POST,
  //       url: ApiUrls.login));
  // }
  //
  // @override
  // Future<Either<BaseError, InitModel>> resetPasswordConfirmSource(ResetPasswordConfirmRequest resetPasswordConfirmRequest) {
  //   return request<InitModel, RegisterResponse>(ApiCallParams<RegisterResponse>(
  //       responseStr: "RegisterResponse",
  //       mapper: (json) => RegisterResponse.fromJson(json),
  //       data: resetPasswordConfirmRequest.toJson(),
  //       method: HttpMethod.POST,
  //       url: ApiUrls.resetPasswordConfirm));
  // }
  //
  // @override
  // Future<Either<BaseError, InitModel>> resetPasswordSource(ResetPasswordRequest resetPasswordRequest) {
  //   return request<InitModel, RegisterResponse>(ApiCallParams<RegisterResponse>(
  //       responseStr: "RegisterResponse",
  //       mapper: (json) => RegisterResponse.fromJson(json),
  //       data: resetPasswordRequest.toJson(),
  //       method: HttpMethod.POST,
  //       url: ApiUrls.resetPassword));
  // }
  //
  // @override
  // Future<Either<BaseError, InitModel>> accessTokenSource(AccessTokenSocialRequest accessTokenSocialRequest) {
  //   return request<InitModel, RegisterResponse>(ApiCallParams<RegisterResponse>(
  //       responseStr: "RegisterResponse",
  //       mapper: (json) => RegisterResponse.fromJson(json),
  //       data: accessTokenSocialRequest.toJson(),
  //       method: HttpMethod.POST,
  //       url: ApiUrls.accessTokenSocialgoogle));
  // }

}
