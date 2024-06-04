import 'package:dio/dio.dart';
import 'package:farm_scheduling/core/request/request.dart';


class SendMobileRequest extends Request {
  final String phone;

  SendMobileRequest(this.phone);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map['phoneNumber'] = phone;

    return map;
  }
}


class SendCodeRequest extends Request {
  final String phone;
  final String code;

  SendCodeRequest(this.phone,this.code);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map['phoneNumber'] = phone;
    map['otpCode']=code;

    return map;
  }
}

class GetProfileRequest extends Request
{
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};



    return map;
  }
}

class EditProfileRequest extends Request
{
  String? avatar;
  String? fullName;
  String? address;
  EditProfileRequest({this.avatar,this.fullName,this.address});
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    if(avatar!=null&&avatar!.isNotEmpty) {
      map['avatar']=MultipartFile.fromFileSync(this.avatar!);
    }
      if(fullName!=null&&fullName!.isNotEmpty) {
        map['fullName']=fullName;
      }
      if(address!=null&&address!.isNotEmpty) {
        map['address']=address;
      }
    return map;
  }
}




// class RegisterRequest extends Request
// {
//  final   SetUserModel setUserModel;
//   RegisterRequest({required this.setUserModel});
//   @override
//   Map<String, dynamic> toJson() {
//    return setUserModel.toJson();
//   }
//
// }
// class EditProfileRequest extends Request
// {
//   final   SetUserModel setUserModel;
//   EditProfileRequest({required this.setUserModel});
//   @override
//   Map<String, dynamic> toJson() {
//     return setUserModel.toJson();
//   }
//
// }
//
// class LoginRequest extends Request
// {
//   final   SetUserModel setUserModel;
//   LoginRequest({required this.setUserModel});
//   @override
//   Map<String, dynamic> toJson() {
//     return setUserModel.toJson();
//   }
//
// }
// class ResetPasswordRequest extends Request
// {
//   final   SetUserModel setUserModel;
//   ResetPasswordRequest({required this.setUserModel});
//   @override
//   Map<String, dynamic> toJson() {
//     return setUserModel.toJson();
//   }
// }
// class ResetPasswordConfirmRequest extends Request
// {
//   final   SetUserModel setUserModel;
//   ResetPasswordConfirmRequest({required this.setUserModel});
//   @override
//   Map<String, dynamic> toJson() {
//     return setUserModel.toJson();
//   }
// }

class AccessTokenSocialRequest extends Request
{
  final  String accessToken;
  AccessTokenSocialRequest({required this.accessToken});
  @override
  Map<String, dynamic> toJson() {
    return {'access_token':accessToken};
  }
}
