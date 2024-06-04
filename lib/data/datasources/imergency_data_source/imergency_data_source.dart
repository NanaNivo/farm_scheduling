import 'package:dartz/dartz.dart';
import 'package:farm_scheduling/core/datasources/remote_data_source.dart';
import 'package:farm_scheduling/core/error/base_error.dart';
import 'package:farm_scheduling/data/models/auth_model.dart';
import 'package:farm_scheduling/data/models/emrgincy_model.dart';
import 'package:farm_scheduling/data/models/emrgincy_type_mode.dart';
import 'package:farm_scheduling/data/requests/emrgincy_request.dart';



import '../../requests/auth_request.dart';


abstract class ImergencyDataSource extends RemoteDataSource {


   Future<Either<BaseError,List<EmergencyModel>>> getImrgencySource(EmergincyRequest emergincyRequest);
   Future<Either<BaseError,EmergencyTypeModel>> getImrgencyTypeListSource(EmergincyTypeListRequest emergincyTypeListRequest);
   Future<Either<BaseError,bool>> addEmergencySource(AddEmergencyRequest addEmergencyRequest);

}
