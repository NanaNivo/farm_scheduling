import 'package:dartz/dartz.dart';
import 'package:farm_scheduling/core/datasources/remote_data_source.dart';
import 'package:farm_scheduling/core/error/base_error.dart';
import 'package:farm_scheduling/data/models/auth_model.dart';



import '../../requests/auth_request.dart';


abstract class AuthDataSource extends RemoteDataSource {
  // Future<Either<BaseError, InitModel>> setMobileId(SetMobileIdRequest setMobileIdRequest);
  // Future<Either<BaseError, List<CurrencyModel>?>> getCurrencies();
  // Future<Either<BaseError, String?>> changeCurrency(ChangeCurrencyRequest changeCurrencyRequest);
  //
  // Future<Either<BaseError,InitModel>> registerSource(RegisterRequest registerRequest);
  //
  // Future<Either<BaseError,InitModel>> editProfileSourse(EditProfileRequest editProfileRequest);
  //
   Future<Either<BaseError,bool>> loginSource(SendMobileRequest loginRequest);
   Future<Either<BaseError,AuthModel>> SendCode(SendCodeRequest sendCodeRequest);
   Future<Either<BaseError,AuthModel>> getProfile(GetProfileRequest getProfileRequest);
   Future<Either<BaseError,AuthModel>> editProfileSourse(EditProfileRequest editProfileRequest);
  // Future<Either<BaseError,InitModel>> resetPasswordSource(ResetPasswordRequest resetPasswordRequest);
  // Future<Either<BaseError,InitModel>> resetPasswordConfirmSource(ResetPasswordConfirmRequest resetPasswordConfirmRequest);
  // Future<Either<BaseError,InitModel>> accessTokenSource(AccessTokenSocialRequest accessTokenSocialRequest);



}
