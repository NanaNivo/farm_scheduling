import 'package:farm_scheduling/core/error/base_error.dart';
import 'package:farm_scheduling/core/param/base_param.dart';
import 'package:farm_scheduling/core/result/result.dart';
import 'package:farm_scheduling/core/usecases/base_use_case.dart';
import 'package:farm_scheduling/data/models/emrgincy_model.dart';
import 'package:farm_scheduling/data/models/emrgincy_type_mode.dart';
import 'package:farm_scheduling/data/requests/emrgincy_request.dart';
import 'package:farm_scheduling/domain/repositories/emergincy_repository.dart';

class EmergencyUseCase
    extends UseCase<Future<Result<BaseError, List<EmergencyModel>>>,EmergencyParams > {
  final  ImergencyRepository imergencyRepository;

  EmergencyUseCase({required this.imergencyRepository});

  @override
  Future<Result<BaseError,  List<EmergencyModel>>> call(EmergencyParams params) {

    return imergencyRepository.getEmergincyList(params.emergincyRequest);
  }
}

class AddEmergencyUseCase
    extends UseCase<Future<Result<BaseError, bool>>,AddEmergeParams > {
  final  ImergencyRepository imergencyRepository;

  AddEmergencyUseCase({required this.imergencyRepository});

  @override
  Future<Result<BaseError,  bool>> call(AddEmergeParams params) {

    return imergencyRepository.addEmergincy(params.addEmergencyRequest);
  }
}



class EmergencyTypeUseCase
    extends UseCase<Future<Result<BaseError, EmergencyTypeModel>>,EmergeTypeParams > {
  final  ImergencyRepository imergencyRepository;

  EmergencyTypeUseCase({required this.imergencyRepository});

  @override
  Future<Result<BaseError, EmergencyTypeModel>> call(EmergeTypeParams params) {

    return imergencyRepository.getEmergincyListType(params.emergincyTypeListRequest);
  }
}

class EmergencyParams extends BaseParams {
  EmergincyRequest emergincyRequest;

  EmergencyParams({required this.emergincyRequest});
}

class EmergeTypeParams extends BaseParams {
  EmergincyTypeListRequest emergincyTypeListRequest;

  EmergeTypeParams({required this.emergincyTypeListRequest});
}


class AddEmergeParams extends BaseParams {
  AddEmergencyRequest addEmergencyRequest;

  AddEmergeParams({required this.addEmergencyRequest});
}