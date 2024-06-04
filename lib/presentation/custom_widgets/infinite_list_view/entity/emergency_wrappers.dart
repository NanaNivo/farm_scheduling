import 'package:farm_scheduling/data/models/emrgincy_model.dart';
import 'package:farm_scheduling/data/requests/emrgincy_request.dart';
import 'package:farm_scheduling/domain/usecases/emergency_usecase.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/pagination_params.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/usecase_wrapper.dart';

class GetEmergencyListUseCase extends UseCaseWrapper<EmergencyModel, PaginationParams> {
  final EmergencyUseCase emergencyUseCase;

  GetEmergencyListUseCase({required this.emergencyUseCase}) ;

  @override
  Future<List<EmergencyModel>> caller(PaginationParams params) async {
    print('GetPublicActivities: }');
    final response = await emergencyUseCase(EmergencyParams(emergincyRequest: EmergincyRequest(
      limit: params.limit,
      page: params.startIndex,
      //    categoryId: params.extraParams['categories']??'',
    ),
      // categoryId: params.extraParams['categoryId'],
    ));
    return responseChecker(response);
  }
}