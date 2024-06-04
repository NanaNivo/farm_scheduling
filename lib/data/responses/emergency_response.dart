
import 'package:farm_scheduling/core/response/api_response.dart';
import 'package:farm_scheduling/data/models/emrgincy_model.dart';
import 'package:farm_scheduling/data/models/emrgincy_type_mode.dart';



class EmergencyResponse extends ApiResponse<List<EmergencyModel>?> {
  EmergencyResponse(
      String msg,
      bool hasError,
      List<EmergencyModel>? result,
      ) : super(msg, hasError, result);

  factory EmergencyResponse.fromJson(json) {
    print('hi there');
    String message = '';
    bool isSuccess = json['success'];
    List<EmergencyModel>? model;

    if (isSuccess) {
      model = (json['pagination']['items'] as List)
          .map((e) => EmergencyModel.fromJson(e))
          .toList();;
    } else {
      message = json['error'];
    }

    return EmergencyResponse(message, !isSuccess, model);
  }
}


class EmergencyListTypeResponse extends ApiResponse<EmergencyTypeModel?> {
  EmergencyListTypeResponse(
      String msg,
      bool hasError,
      EmergencyTypeModel? result,
      ):super(msg, hasError, result);

  factory EmergencyListTypeResponse.fromJson(json) {
    print('hi there');
    String message = '';
    bool isSuccess = json['success'];
    EmergencyTypeModel? model;

    if (isSuccess) {
      model = EmergencyTypeModel.fromJson(json);
    } else {
      message = json['error'];
    }

    return EmergencyListTypeResponse(message, !isSuccess, model);
  }
}


class AddEmergencyResponse extends ApiResponse<bool?> {
  AddEmergencyResponse(
      String msg,
      bool hasError,
      bool? result,
      ):super(msg, hasError, result);

  factory AddEmergencyResponse.fromJson(json) {
    print('hi there');
    String message = '';
    bool isSuccess = json['success'];
    bool? model;

    if (isSuccess) {
      model =isSuccess;
    } else {
      message = json['error'];
    }

    return AddEmergencyResponse(message, !isSuccess, model);
  }
}