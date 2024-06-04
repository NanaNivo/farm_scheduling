// import 'package:farm_scheduling/data/models/product_model.dart';
// import 'package:farm_scheduling/data/requests/product_request.dart';
// import 'package:farm_scheduling/domain/usecases/product_usecase.dart';
import 'package:farm_scheduling/data/models/crop_model.dart';
import 'package:farm_scheduling/data/models/farm_model.dart';
import 'package:farm_scheduling/data/models/field_model.dart';
import 'package:farm_scheduling/data/models/task_field_model.dart';
import 'package:farm_scheduling/data/models/tool_farm_model.dart';
import 'package:farm_scheduling/data/requests/farm_request.dart';
import 'package:farm_scheduling/domain/usecases/farm_usecase.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/pagination_params.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/usecase_wrapper.dart';

class GetFarmUseCase extends UseCaseWrapper<FarmModel, PaginationParams> {
  final FarmUseCase farmUseCase;

  GetFarmUseCase({required this.farmUseCase}) ;

  @override
  Future<List<FarmModel>> caller(PaginationParams params) async {
    print('GetPublicActivities: }');
    final response = await farmUseCase(FarmParams(farmRequest: FarmRequest(
        limit: params.limit,
        page: params.startIndex,
    //    categoryId: params.extraParams['categories']??'',
       ),
      // categoryId: params.extraParams['categoryId'],
    ));
    return responseChecker(response);
  }
}

class GetFieldUseCase extends UseCaseWrapper<FieldModel, PaginationParams> {
  final FieldUseCase fieldUseCase;

  GetFieldUseCase({required this.fieldUseCase}) ;

  @override
  Future<List<FieldModel>> caller(PaginationParams params) async {
   // print('GetPublicActivities: }');
    final response = await fieldUseCase(FieldParams(fieldRequest: FieldRequest(
      limit: params.limit,
      page: params.startIndex,
          farm: params.extraParams['farm'],
    ),
      // categoryId: params.extraParams['categoryId'],
    ));
    return responseChecker(response);
  }
}

class GetFieldDropDownUseCase extends UseCaseWrapper<FieldModel, PaginationParams> {
  final FieldUseCase fieldUseCase;

  GetFieldDropDownUseCase({required this.fieldUseCase}) ;

  @override
  Future<List<FieldModel>> caller(PaginationParams params) async {
    print('GetPublicActivities: }${params.extraParams['farm']}');
    final response = await fieldUseCase(FieldParams(fieldRequest: FieldRequest(
      limit: params.limit,
      page: params.startIndex,
      farm: params.extraParams['farm'],
    ),
      // categoryId: params.extraParams['categoryId'],
    ));
    return responseChecker(response);
  }
}

class GetToolUseCase extends UseCaseWrapper<ToolFarmModel, PaginationParams> {
  final ToolUseCase toolUseCase;

  GetToolUseCase({required this.toolUseCase}) ;

  @override
  Future<List<ToolFarmModel>> caller(PaginationParams params) async {
    // print('GetPublicActivities: }');
    final response = await toolUseCase(ToolParams(toolRequest: ToolRequest(
      limit: params.limit,
      page: params.startIndex,
      farm: params.extraParams['farm'],
    ),
      // categoryId: params.extraParams['categoryId'],
    ));
    return responseChecker(response);
  }
}



class GetTaskUseCase extends UseCaseWrapper<TaskFieldModel, PaginationParams> {
  final TaskUseCase taskUseCase;

  GetTaskUseCase({required this.taskUseCase}) ;

  @override
  Future<List<TaskFieldModel>> caller(PaginationParams params) async {
    // print('GetPublicActivities: }');
    final response = await taskUseCase(TaskParams(taskRequest: TaskRequest(
      limit: params.limit,
      page: params.startIndex,
     field: params.extraParams['field'],
    ),
      // categoryId: params.extraParams['categoryId'],
    ));
    return responseChecker(response);
  }
}


class GetCropUseCase extends UseCaseWrapper<CropModel, PaginationParams> {
  final CropUseCase cropUseCase;

  GetCropUseCase({required this.cropUseCase}) ;

  @override
  Future<List<CropModel>> caller(PaginationParams params) async {
    // print('GetPublicActivities: }');
    final response = await cropUseCase(CropParams(cropRequest: CropRequest(
      limit: params.limit,
      page: params.startIndex,
    ),
      // categoryId: params.extraParams['categoryId'],
    ));
    return responseChecker(response);
  }
}

class GetCropSeedUseCase extends UseCaseWrapper<CropSeed, PaginationParams> {
  final CropSeedUseCase cropSeedUseCase;

  GetCropSeedUseCase({required this.cropSeedUseCase}) ;

  @override
  Future<List<CropSeed>> caller(PaginationParams params) async {
    // print('GetPublicActivities: }');
    final response = await cropSeedUseCase(CropSeedParams(cropSeedRequest: CropSeedRequest(
      limit: params.limit,
      page: params.startIndex, crop: params.extraParams['crop'],
    ),
      // categoryId: params.extraParams['categoryId'],
    ));
    return responseChecker(response);
  }
}



// class GetCategoryPaginationUseCase extends UseCaseWrapper<Categories, PaginationParams> {
//   final GetCategoryUseCase getCategoryUseCase;
//
//   GetCategoryPaginationUseCase({required this.getCategoryUseCase}) ;
//
//   @override
//   Future<List<Categories>> caller(PaginationParams params) async {
//     print('GetPublicActivities: }');
//     final response = await getCategoryUseCase(CategoryParms(categoryRequest: CategoryRequest(
//         pageSize: params.limit,
//         page: params.startIndex),
//       // categoryId: params.extraParams['categoryId'],
//     ));
//     return responseChecker(response);
//   }
// }