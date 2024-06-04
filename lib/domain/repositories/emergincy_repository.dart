import 'package:farm_scheduling/core/error/base_error.dart';
import 'package:farm_scheduling/core/repositories/repository.dart';
import 'package:farm_scheduling/core/result/result.dart';
import 'package:farm_scheduling/data/models/emrgincy_model.dart';
import 'package:farm_scheduling/data/models/emrgincy_type_mode.dart';
import 'package:farm_scheduling/data/requests/emrgincy_request.dart';

abstract class ImergencyRepository extends Repository {
  Future<Result<BaseError, List<EmergencyModel>>> getEmergincyList(EmergincyRequest emergincyRequest);
  Future<Result<BaseError, EmergencyTypeModel>> getEmergincyListType(EmergincyTypeListRequest emergincyTypeListRequest);

  Future<Result<BaseError, bool>> addEmergincy(AddEmergencyRequest addEmergencyRequest);
}