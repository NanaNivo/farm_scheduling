import 'package:farm_scheduling/core/response/api_response.dart';
import 'package:farm_scheduling/data/models/auth_model.dart';

class LoginResponse extends ApiResponse<bool?> {
  LoginResponse(
      String msg,
      bool hasError,
      bool? result,
      ) : super(msg, hasError, result);

  factory LoginResponse.fromJson(json) {
    print('hi there');
    String message = '';
    bool isSuccess = json['success'];
    bool? model;

    if (isSuccess) {
      model = json['success'];
    } else {
      message = json['error'];
    }

    return LoginResponse(message, !isSuccess, model);
  }
}

class SenCodeResponse extends ApiResponse<AuthModel?> {
  SenCodeResponse(
      String msg,
      bool hasError,
      AuthModel? result,
      ) : super(msg, hasError, result);

  factory SenCodeResponse.fromJson(json) {
    print('hi there');
    String message = '';
    bool isSuccess = json['success'];
    AuthModel? model;

    if (isSuccess) {
      model = AuthModel.fromJson(json);
    } else {
      message = json['error'];
    }

    return SenCodeResponse(message, !isSuccess, model);
  }
}

class GetProfileResponse extends ApiResponse<AuthModel?> {
  GetProfileResponse(
      String msg,
      bool hasError,
      AuthModel? result,
      ) : super(msg, hasError, result);

  factory GetProfileResponse.fromJson(json) {
    print('hi there');
    String message = '';
    bool isSuccess = json['success'];
    AuthModel? model;

    if (isSuccess) {
      model = AuthModel.fromJson(json);
    } else {
      message = json['error'];
    }

    return GetProfileResponse(message, !isSuccess, model);
  }
}

class UpdateProfileResponse extends ApiResponse<AuthModel?> {
  UpdateProfileResponse(
      String msg,
      bool hasError,
      AuthModel? result,
      ) : super(msg, hasError, result);

  factory UpdateProfileResponse.fromJson(json) {
    print('hi there');
    String message = '';
    bool isSuccess = json['success'];
    AuthModel? model;

    if (isSuccess) {
      model = AuthModel.fromJson(json);
    } else {
      message = json['error'];
    }

    return UpdateProfileResponse(message, !isSuccess, model);
  }
}



// class RegisterResponse extends ApiResponse<InitModel?> {
//   RegisterResponse(
//       String msg,
//       bool hasError,
//       InitModel? result,
//       ) : super(msg, hasError, result);
//
//   factory RegisterResponse.fromJson(json) {
//     String message = '';
//     bool isSuccess = json['result'] == 'success';
//     InitModel? model;
//     if (isSuccess) {
//       model = InitModel.fromJson(json);
//     } else {
//
//       message =json['error_des'];
//     }
//
//     return RegisterResponse(message, !isSuccess, model);
//   }
// }
//
//
// class AccessTokenResponse extends ApiResponse<InitModel?> {
//   AccessTokenResponse(
//       String msg,
//       bool hasError,
//       InitModel? result,
//       ) : super(msg, hasError, result);
//
//   factory AccessTokenResponse.fromJson(json) {
//     String message = '';
//     bool isSuccess = json['result'] == 'success';
//     InitModel? model;
//     if (isSuccess) {
//       model = InitModel.fromJson(json['client']);
//     } else {
//
//       message =json['error_des'];
//     }
//
//     return AccessTokenResponse(message, !isSuccess, model);
//   }
// }