import 'package:dartz/dartz.dart';
import 'package:farm_scheduling/core/datasources/api_call_params.dart';
import 'package:farm_scheduling/core/datasources/function_instance.dart';
import 'package:farm_scheduling/core/enums/api/HttpMethod.dart';
import 'package:farm_scheduling/core/resources/apis.dart';
import 'package:farm_scheduling/data/datasources/imergency_data_source/imergency_data_source.dart';
import 'package:farm_scheduling/data/models/auth_model.dart';
import 'package:farm_scheduling/data/models/emrgincy_model.dart';
import 'package:farm_scheduling/data/models/emrgincy_type_mode.dart';
import 'package:farm_scheduling/data/requests/emrgincy_request.dart';

import 'package:farm_scheduling/data/responses/auth_response.dart';
import 'package:farm_scheduling/data/responses/emergency_response.dart';

import '../../../core/error/base_error.dart';

import '../../requests/auth_request.dart';



class EmergincyDataSourceImpl extends ImergencyDataSource {
  @override
  Future<Either<BaseError, List<EmergencyModel>>> getImrgencySource(EmergincyRequest emergincyRequest) {
      return request<List<EmergencyModel>,EmergencyResponse >(
          ApiCallParams<EmergencyResponse>(
              responseStr: "EmergencyResponse",
              mapper: (json) => EmergencyResponse.fromJson(json),
              method: HttpMethod.GET,
              data:emergincyRequest.toJson() ,
              url: ApiUrls.emergency));
    }

  @override
  Future<Either<BaseError, EmergencyTypeModel>> getImrgencyTypeListSource(EmergincyTypeListRequest emergincyTypeListRequest) {
    return request<EmergencyTypeModel,EmergencyListTypeResponse >(
        ApiCallParams<EmergencyListTypeResponse>(
            responseStr: "EmergencyListTypeResponse",
            mapper: (json) => EmergencyListTypeResponse.fromJson(json),
            method: HttpMethod.GET,
            data:emergincyTypeListRequest.toJson() ,
            url: ApiUrls.emergencyType));
  }

  @override
  Future<Either<BaseError, bool>> addEmergencySource(AddEmergencyRequest addEmergencyRequest) {
    return request<bool,AddEmergencyResponse >(
        ApiCallParams<AddEmergencyResponse>(
            responseStr: "AddEmergencyResponse",
            mapper: (json) => AddEmergencyResponse.fromJson(json),
            method: HttpMethod.POST,
            data:addEmergencyRequest.toJson() ,
            url: ApiUrls.emergencyAdded));
  }


}
