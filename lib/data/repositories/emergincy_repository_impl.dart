import 'package:farm_scheduling/core/error/base_error.dart';
import 'package:farm_scheduling/core/result/result.dart';
import 'package:farm_scheduling/data/datasources/fatm_data_source/farm_data_source.dart';
import 'package:farm_scheduling/data/datasources/imergency_data_source/imergency_data_source.dart';
import 'package:farm_scheduling/data/models/emrgincy_model.dart';
import 'package:farm_scheduling/data/models/emrgincy_type_mode.dart';
import 'package:farm_scheduling/data/requests/emrgincy_request.dart';
import 'package:farm_scheduling/domain/repositories/emergincy_repository.dart';

class ImergencyRepositoryImpl extends ImergencyRepository
{
 final ImergencyDataSource imergencyDataSource;
 ImergencyRepositoryImpl({required this.imergencyDataSource});
  @override
  Future<Result<BaseError, List<EmergencyModel>>> getEmergincyList(EmergincyRequest emergincyRequest) async {
    final result = await imergencyDataSource.getImrgencySource(emergincyRequest);
    return executeWithoutConvert(remoteResult: result);
  }


 @override
 Future<Result<BaseError, EmergencyTypeModel>> getEmergincyListType(EmergincyTypeListRequest emergincyTypeListRequest) async {
   final result = await imergencyDataSource.getImrgencyTypeListSource(emergincyTypeListRequest);
   return executeWithoutConvert(remoteResult: result);
 }


 @override
 Future<Result<BaseError, bool>> addEmergincy(AddEmergencyRequest addEmergencyRequest) async {
   final result = await imergencyDataSource.addEmergencySource(addEmergencyRequest);
   return executeWithoutConvert(remoteResult: result);
 }

}