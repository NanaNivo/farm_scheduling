import 'package:farm_scheduling/core/error/base_error.dart';
import 'package:farm_scheduling/core/result/result.dart';
import 'package:farm_scheduling/data/datasources/fatm_data_source/farm_data_source.dart';
import 'package:farm_scheduling/data/models/crop_model.dart';
import 'package:farm_scheduling/data/models/farm_model.dart';
import 'package:farm_scheduling/data/models/field_model.dart';
import 'package:farm_scheduling/data/models/task_field_model.dart';
import 'package:farm_scheduling/data/models/tool_farm_model.dart';
import 'package:farm_scheduling/data/requests/farm_request.dart';
import 'package:farm_scheduling/domain/repositories/farm_repository.dart';

class FarmRepositoryImp extends FarmRepository
{
  final FarmDataSource farmDataSource;
  FarmRepositoryImp({required this.farmDataSource});
  @override
  Future<Result<BaseError, List<FarmModel>>> getfarmList(FarmRequest farmRequest) async {
    final result = await farmDataSource.getFarmListSource(farmRequest);

    return executeWithoutConvert(remoteResult: result);
  }

  @override
  Future<Result<BaseError, List<FieldModel>>> getFieldList(FieldRequest fieldRequest) async{
    final result = await farmDataSource.getFieldListSource(fieldRequest);
    return executeWithoutConvert(remoteResult: result);
  }

  @override
  Future<Result<BaseError, List<ToolFarmModel>>> getToolList(ToolRequest toolRequest) async{
    final result = await farmDataSource.getToolListSource(toolRequest);

    return executeWithoutConvert(remoteResult: result);
  }


  @override
  Future<Result<BaseError, List<TaskFieldModel>>> getTaskFieldList(TaskRequest taskRequest) async{
    final result = await farmDataSource.getTaskListSource(taskRequest);
    return executeWithoutConvert(remoteResult: result);
  }

  @override
  Future<Result<BaseError, List<CropModel>>> getCropList(CropRequest cropRequest) async{
    final result = await farmDataSource.getCropListSource(cropRequest);
    return executeWithoutConvert(remoteResult: result);
  }

  @override
  Future<Result<BaseError, List<CropSeed>>> getCropSeedList(CropSeedRequest cropSeedRequest) async{
    final result = await farmDataSource.getCropSeedListSource(cropSeedRequest);
    return executeWithoutConvert(remoteResult: result);
  }


  @override
  Future<Result<BaseError, bool>> addField(AddFieldRequest addFieldRequest) async{
    final result = await farmDataSource.addFieldSource(addFieldRequest);
    return executeWithoutConvert(remoteResult: result);
  }

  @override
  Future<Result<BaseError, bool>> updateStatusField(UpdateStatusFieldRequest updateStatusFieldRequest) async {
    final result = await farmDataSource.updateTaskField(updateStatusFieldRequest);
    return executeWithoutConvert(remoteResult: result);
  }


}
