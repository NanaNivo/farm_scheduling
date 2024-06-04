import 'package:farm_scheduling/core/response/api_response.dart';
import 'package:farm_scheduling/data/models/crop_model.dart';
import 'package:farm_scheduling/data/models/farm_model.dart';
import 'package:farm_scheduling/data/models/field_model.dart';
import 'package:farm_scheduling/data/models/task_field_model.dart';
import 'package:farm_scheduling/data/models/tool_farm_model.dart';

class FarmListResponse extends ApiResponse<List<FarmModel>?> {
  FarmListResponse(
      String msg,
      bool hasError,
      List<FarmModel>? result,
      ) : super(msg, hasError, result);

  factory FarmListResponse.fromJson(json) {
    print('hi there');
    String message = '';
    bool isSuccess = json['success'];
    List<FarmModel>? model;

    if (isSuccess) {
      model= (json['pagination']['items'] as List)
          .map((e) => FarmModel.fromJson(e))
          .toList();

    } else {
      message = json['error'];
    }

    return FarmListResponse(message, !isSuccess, model);
  }
}


class FieldListResponse extends ApiResponse<List<FieldModel>?> {
  FieldListResponse(
      String msg,
      bool hasError,
      List<FieldModel>? result,
      ) : super(msg, hasError, result);

  factory FieldListResponse.fromJson(json) {
    print('hi there');
    String message = '';
    bool isSuccess = json['success'];
    List<FieldModel>? model;

    if (isSuccess) {
      model= (json['pagination']['items'] as List)
          .map((e) => FieldModel.fromJson(e))
          .toList();

    } else {
      message = json['error'];
    }

    return FieldListResponse(message, !isSuccess, model);
  }
}

class ToolListResponse extends ApiResponse<List<ToolFarmModel>?> {
  ToolListResponse(
      String msg,
      bool hasError,
      List<ToolFarmModel>? result,
      ) : super(msg, hasError, result);

  factory ToolListResponse.fromJson(json) {
    print('hi there');
    String message = '';
    bool isSuccess = json['success'];
    List<ToolFarmModel>? model;

    if (isSuccess) {
      model= (json['pagination']['items'] as List)
          .map((e) => ToolFarmModel.fromJson(e))
          .toList();

    } else {
      message = json['error'];
    }

    return ToolListResponse(message, !isSuccess, model);
  }
}


class TaskFieldListResponse extends ApiResponse<List<TaskFieldModel>?> {
  TaskFieldListResponse(
      String msg,
      bool hasError,
      List<TaskFieldModel>? result,
      ) : super(msg, hasError, result);

  factory TaskFieldListResponse.fromJson(json) {
    print('hi there');
    String message = '';
    bool isSuccess = json['success'];
    List<TaskFieldModel>? model;

    if (isSuccess) {
      model= (json['pagination']['items'] as List)
          .map((e) => TaskFieldModel.fromJson(e))
          .toList();

    } else {
      message = json['error'];
    }

    return TaskFieldListResponse(message, !isSuccess, model);
  }
}


class CropListResponse extends ApiResponse<List<CropModel>?> {
  CropListResponse(
      String msg,
      bool hasError,
      List<CropModel>? result,
      ) : super(msg, hasError, result);

  factory CropListResponse.fromJson(json) {
    print('hi there');
    String message = '';
    bool isSuccess = json['success'];
    List<CropModel>? model;

    if (isSuccess) {
      model= (json['pagination']['items'] as List)
          .map((e) => CropModel.fromJson(e))
          .toList();

    } else {
      message = json['error'];
    }

    return CropListResponse(message, !isSuccess, model);
  }
}
class CropSeedListResponse extends ApiResponse<List<CropSeed>?> {
  CropSeedListResponse(
      String msg,
      bool hasError,
      List<CropSeed>? result,
      ) : super(msg, hasError, result);

  factory CropSeedListResponse.fromJson(json) {
    print('hi there');
    String message = '';
    bool isSuccess = json['success'];
    List<CropSeed>? model;

    if (isSuccess) {
      model= (json['pagination']['items'] as List)
          .map((e) => CropSeed.fromJson(e))
          .toList();

    } else {
      message = json['error'];
    }

    return CropSeedListResponse(message, !isSuccess, model);
  }
}


class AddFieldResponse extends ApiResponse<bool?> {
  AddFieldResponse(
      String msg,
      bool hasError,
      bool? result,
      ) : super(msg, hasError, result);

  factory AddFieldResponse.fromJson(json) {
    print('hi there');
    String message = '';
    bool isSuccess = json['success'];
    bool? model;

    if (isSuccess) {
      model= isSuccess;

    } else {
      message = json['error'];
    }

    return AddFieldResponse(message, !isSuccess, model);
  }
}

class UpdateStatusFieldResponse extends ApiResponse<bool?> {
  UpdateStatusFieldResponse(
      String msg,
      bool hasError,
      bool? result,
      ) : super(msg, hasError, result);

  factory UpdateStatusFieldResponse.fromJson(json) {
    print('hi there');
    String message = '';
    bool isSuccess = json['success'];
    bool? model;

    if (isSuccess) {
      model= isSuccess;

    } else {
      message = json['error'];
    }

    return UpdateStatusFieldResponse(message, !isSuccess, model);
  }
}