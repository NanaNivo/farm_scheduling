import 'package:farm_scheduling/core/error/base_error.dart';
import 'package:farm_scheduling/core/param/base_param.dart';
import 'package:farm_scheduling/core/result/result.dart';
import 'package:farm_scheduling/core/usecases/base_use_case.dart';
import 'package:farm_scheduling/data/models/crop_model.dart';
import 'package:farm_scheduling/data/models/farm_model.dart';
import 'package:farm_scheduling/data/models/field_model.dart';
import 'package:farm_scheduling/data/models/task_field_model.dart';
import 'package:farm_scheduling/data/models/tool_farm_model.dart';
import 'package:farm_scheduling/data/requests/farm_request.dart';
import 'package:farm_scheduling/domain/repositories/auth_repository.dart';
import 'package:farm_scheduling/domain/repositories/farm_repository.dart';
import 'package:farm_scheduling/domain/usecases/auth_use_cases.dart';
import 'package:flutter/material.dart';

class FarmUseCase
    extends UseCase<Future<Result<BaseError, List<FarmModel>>>, FarmParams> {
   final FarmRepository farmRepository;

  FarmUseCase({required this.farmRepository});

  @override
  Future<Result<BaseError, List<FarmModel>>> call(FarmParams params) {

    return farmRepository.getfarmList(params.farmRequest);
  }
}

class FieldUseCase
    extends UseCase<Future<Result<BaseError, List<FieldModel>>>, FieldParams> {
  final FarmRepository farmRepository;

  FieldUseCase({required this.farmRepository});

  @override
  Future<Result<BaseError, List<FieldModel>>> call(FieldParams params) {

    return farmRepository.getFieldList(params.fieldRequest);
  }
}


class TaskUseCase
    extends UseCase<Future<Result<BaseError, List<TaskFieldModel>>>, TaskParams> {
  final FarmRepository farmRepository;

  TaskUseCase({required this.farmRepository});

  @override
  Future<Result<BaseError, List<TaskFieldModel>>> call(TaskParams params) {
    return farmRepository.getTaskFieldList(params.taskRequest);
  }
}


class ToolUseCase
    extends UseCase<Future<Result<BaseError, List<ToolFarmModel>>>, ToolParams> {
  final FarmRepository farmRepository;

  ToolUseCase({required this.farmRepository});

  @override
  Future<Result<BaseError, List<ToolFarmModel>>> call(ToolParams params) {

    return farmRepository.getToolList(params.toolRequest);
  }
}



class CropUseCase
    extends UseCase<Future<Result<BaseError, List<CropModel>>>, CropParams> {
  final FarmRepository farmRepository;

  CropUseCase({required this.farmRepository});

  @override
  Future<Result<BaseError, List<CropModel>>> call(CropParams params) {
    return farmRepository.getCropList(params.cropRequest);
  }
}


class CropSeedUseCase
    extends UseCase<Future<Result<BaseError, List<CropSeed>>>,CropSeedParams > {
  final FarmRepository farmRepository;

  CropSeedUseCase({required this.farmRepository});

  @override
  Future<Result<BaseError, List<CropSeed>>> call(CropSeedParams params) {
    return farmRepository.getCropSeedList(params.cropSeedRequest);
  }
}



class AddFieldUseCase
    extends UseCase<Future<Result<BaseError, bool>>,AddFieldParams> {
  final FarmRepository farmRepository;

  AddFieldUseCase({required this.farmRepository});

  @override
  Future<Result<BaseError, bool>> call(AddFieldParams params) {
    return farmRepository.addField(params.addFieldRequest);
  }
}


class UpdateStatusFieldUseCase
    extends UseCase<Future<Result<BaseError, bool>>,UpdateFieldParams> {
  final FarmRepository farmRepository;

  UpdateStatusFieldUseCase({required this.farmRepository});

  @override
  Future<Result<BaseError, bool>> call(UpdateFieldParams params) {
    return farmRepository.updateStatusField(params.updateStatusFieldRequest);
  }
}


class FarmParams extends BaseParams {
  final FarmRequest farmRequest;

  FarmParams({required this.farmRequest});
}
class FieldParams extends BaseParams {
  final FieldRequest fieldRequest;

  FieldParams({required this.fieldRequest});
}
class ToolParams extends BaseParams {
  final ToolRequest toolRequest;

  ToolParams({required this.toolRequest});
}


class TaskParams extends BaseParams {
  final TaskRequest taskRequest;

  TaskParams({required this.taskRequest});
}


class CropParams extends BaseParams {
  final CropRequest cropRequest;

  CropParams({required this.cropRequest});
}

class CropSeedParams extends BaseParams {
  final CropSeedRequest cropSeedRequest;

  CropSeedParams({required this.cropSeedRequest});
}


class AddFieldParams extends BaseParams {
  final AddFieldRequest addFieldRequest;

  AddFieldParams({required this.addFieldRequest});
}

class UpdateFieldParams extends BaseParams {
  final UpdateStatusFieldRequest updateStatusFieldRequest;

  UpdateFieldParams({required this.updateStatusFieldRequest});
}
