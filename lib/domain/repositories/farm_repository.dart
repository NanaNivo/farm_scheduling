import 'package:farm_scheduling/core/error/base_error.dart';
import 'package:farm_scheduling/core/repositories/repository.dart';
import 'package:farm_scheduling/core/result/result.dart';
import 'package:farm_scheduling/data/models/crop_model.dart';
import 'package:farm_scheduling/data/models/farm_model.dart';
import 'package:farm_scheduling/data/models/field_model.dart';
import 'package:farm_scheduling/data/models/task_field_model.dart';
import 'package:farm_scheduling/data/models/tool_farm_model.dart';
import 'package:farm_scheduling/data/requests/farm_request.dart';

abstract class FarmRepository extends Repository
{
  Future<Result<BaseError, List<FarmModel>>> getfarmList(FarmRequest farmRequest);

  Future<Result<BaseError, List<FieldModel>>> getFieldList(FieldRequest fieldRequest);
  Future<Result<BaseError, List<ToolFarmModel>>> getToolList(ToolRequest toolRequest);

  Future<Result<BaseError, List<TaskFieldModel>>> getTaskFieldList(TaskRequest taskRequest);
  Future<Result<BaseError, List<CropModel>>> getCropList(CropRequest cropRequest);
  Future<Result<BaseError, List<CropSeed>>> getCropSeedList(CropSeedRequest cropSeedRequest);
  Future<Result<BaseError, bool>> addField(AddFieldRequest addFieldRequest);
  Future<Result<BaseError, bool>> updateStatusField(UpdateStatusFieldRequest updateStatusFieldRequest);
}