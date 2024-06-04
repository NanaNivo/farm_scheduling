import 'package:dartz/dartz.dart';
import 'package:farm_scheduling/core/datasources/remote_data_source.dart';
import 'package:farm_scheduling/core/error/base_error.dart';
import 'package:farm_scheduling/data/models/crop_model.dart';
import 'package:farm_scheduling/data/models/farm_model.dart';
import 'package:farm_scheduling/data/models/field_model.dart';
import 'package:farm_scheduling/data/models/task_field_model.dart';
import 'package:farm_scheduling/data/models/tool_farm_model.dart';
import 'package:farm_scheduling/data/requests/farm_request.dart';

abstract class FarmDataSource extends RemoteDataSource {
  Future<Either<BaseError,List<FarmModel>>> getFarmListSource(FarmRequest farmRequest);
  Future<Either<BaseError,List<FieldModel>>> getFieldListSource( FieldRequest fieldRequest);
  Future<Either<BaseError,List<ToolFarmModel>>> getToolListSource(ToolRequest toolRequest);
  Future<Either<BaseError,List<TaskFieldModel>>> getTaskListSource(TaskRequest taskRequest);
  Future<Either<BaseError,List<CropModel>>>getCropListSource(CropRequest cropRequest);
  Future<Either<BaseError, List<CropSeed>>> getCropSeedListSource(CropSeedRequest cropSeedRequest);
  Future<Either<BaseError, bool>> addFieldSource(AddFieldRequest addFieldRequest);
  Future<Either<BaseError,bool>> updateTaskField(UpdateStatusFieldRequest updateStatusFieldRequest);

}