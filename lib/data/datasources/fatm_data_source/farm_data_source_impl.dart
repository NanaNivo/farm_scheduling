import 'package:dartz/dartz.dart';
import 'package:farm_scheduling/core/datasources/api_call_params.dart';
import 'package:farm_scheduling/core/enums/api/HttpMethod.dart';
import 'package:farm_scheduling/core/error/base_error.dart';
import 'package:farm_scheduling/core/resources/apis.dart';
import 'package:farm_scheduling/data/datasources/fatm_data_source/farm_data_source.dart';
import 'package:farm_scheduling/data/models/crop_model.dart';
import 'package:farm_scheduling/data/models/farm_model.dart';
import 'package:farm_scheduling/data/models/field_model.dart';
import 'package:farm_scheduling/data/models/task_field_model.dart';
import 'package:farm_scheduling/data/models/tool_farm_model.dart';
import 'package:farm_scheduling/data/requests/farm_request.dart';
import 'package:farm_scheduling/data/responses/farm_response.dart';

class FarmDataSourceImpl extends FarmDataSource
{
  @override
  Future<Either<BaseError, List<FarmModel>>> getFarmListSource(FarmRequest farmRequest) {
    return request<List<FarmModel>, FarmListResponse>(
        ApiCallParams<FarmListResponse>(
            responseStr: "FarmListResponse",
            mapper: (json) => FarmListResponse.fromJson(json),
            method: HttpMethod.GET,
            data:farmRequest.toJson() ,
            url: ApiUrls.farmList));
  }

  @override
  Future<Either<BaseError, List<FieldModel>>> getFieldListSource(FieldRequest fieldRequest) {
    return request<List<FieldModel>, FieldListResponse>(
        ApiCallParams<FieldListResponse>(
            responseStr: "FieldListResponse",
            mapper: (json) => FieldListResponse.fromJson(json),
            method: HttpMethod.GET,
            data:fieldRequest.toJson() ,
            url: ApiUrls.fieldList));
  }

  @override
  Future<Either<BaseError, List<ToolFarmModel>>> getToolListSource(ToolRequest toolRequest) {
    return request<List<ToolFarmModel>, ToolListResponse>(
        ApiCallParams<ToolListResponse>(
            responseStr: "ToolListResponse",
            mapper: (json) => ToolListResponse.fromJson(json),
            method: HttpMethod.GET,
            data:toolRequest.toJson() ,
            url: ApiUrls.toolList));
  }

  @override
  Future<Either<BaseError, List<TaskFieldModel>>> getTaskListSource(TaskRequest taskRequest) {
    return request<List<TaskFieldModel>, TaskFieldListResponse>(
        ApiCallParams<TaskFieldListResponse>(
            responseStr: "TaskFieldListResponse",
            mapper: (json) => TaskFieldListResponse.fromJson(json),
            method: HttpMethod.GET,
            data:taskRequest.toJson() ,
            url: ApiUrls.tasklList));
  }

  @override
  Future<Either<BaseError, List<CropModel>>> getCropListSource(CropRequest cropRequest) {
    return request<List<CropModel>, CropListResponse>(
        ApiCallParams<CropListResponse>(
            responseStr: "CropListResponse",
            mapper: (json) => CropListResponse.fromJson(json),
            method: HttpMethod.GET,
            data:cropRequest.toJson() ,
            url: ApiUrls.getCrop));
  }


  @override
  Future<Either<BaseError, List<CropSeed>>> getCropSeedListSource(CropSeedRequest cropSeedRequest) {
    return request<List<CropSeed>, CropSeedListResponse>(
        ApiCallParams<CropSeedListResponse>(
            responseStr: "CropSeedListResponse",
            mapper: (json) => CropSeedListResponse.fromJson(json),
            method: HttpMethod.GET,
            data:cropSeedRequest.toJson() ,
            url: ApiUrls.getCropSeed));
  }


  @override
  Future<Either<BaseError, bool>> addFieldSource(AddFieldRequest addFieldRequest) {
    return request<bool, AddFieldResponse>(
        ApiCallParams<AddFieldResponse>(
            responseStr: "AddFieldResponse",
            mapper: (json) => AddFieldResponse.fromJson(json),
            method: HttpMethod.POST,
            data:addFieldRequest.toJson() ,
            url: ApiUrls.addField));
  }

  @override
  Future<Either<BaseError, bool>> updateTaskField(UpdateStatusFieldRequest updateStatusFieldRequest) {
    return request<bool, UpdateStatusFieldResponse>(
        ApiCallParams<UpdateStatusFieldResponse>(
            responseStr: "UpdateStatusFieldResponse",
            mapper: (json) => UpdateStatusFieldResponse.fromJson(json),
            method: HttpMethod.PUT,
            data:updateStatusFieldRequest.toJson() ,
            url:'${ApiUrls.tasklList}/${updateStatusFieldRequest.id}'));
  }

}
