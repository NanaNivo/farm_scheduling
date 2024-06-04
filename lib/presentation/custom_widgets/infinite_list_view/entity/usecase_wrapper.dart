

import 'package:carousel_slider/carousel_slider.dart';
import 'package:farm_scheduling/data/models/crop_model.dart';
import 'package:farm_scheduling/data/models/emrgincy_model.dart';
import 'package:farm_scheduling/data/models/emrgincy_type_mode.dart';
import 'package:farm_scheduling/data/models/farm_model.dart';
import 'package:farm_scheduling/data/models/field_model.dart';
import 'package:farm_scheduling/data/models/task_field_model.dart';
import 'package:farm_scheduling/data/models/crop_seed_model.dart' as cropSeed;
import 'package:farm_scheduling/data/models/tool_farm_model.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/emergency_wrappers.dart';
import 'package:flutter/widgets.dart';
import 'package:farm_scheduling/core/error/base_error.dart';
import 'package:farm_scheduling/core/error/connection/net_error.dart';
import 'package:farm_scheduling/core/param/base_param.dart';
import 'package:farm_scheduling/core/result/result.dart';

import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/bloc/infinite_list_bloc.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/pagination_params.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/home_wrappers.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/farm_wrappers.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/presentation/pagination_builder.dart';


typedef AsyncCallbackWithParams<T> = Future<T> Function(BaseParams b);
typedef BuilderType<T> = Widget Function(T data, int index);

class WrapperParams {
  final int startIndex;
  final Map<String, dynamic> extraParams;

  WrapperParams(this.startIndex, this.extraParams);

  WrapperParams copyWith({int? startIndex, Map<String, dynamic>? extraParams}) {
    return PaginationParams(
        startIndex: startIndex ?? this.startIndex, extraParams: extraParams ?? this.extraParams);
  }
}

abstract class UseCaseWrapper<T, P extends WrapperParams> {
  Future<List<T>> caller(P params);

  Future<List<T>> responseChecker(Result<BaseError, List<T>> response) async {
   // print('response.hasDataOnly: ${response.hasDataOnly}');

    if (response.hasDataOnly) {
      print('response.hasDataOnly: ${response.data}');
      return response.data??[];
    } else if (response.hasErrorOnly) {
      print("type error ${response.error is NetError }");
      throw Exception(response.error);
    }
    return [];
  }
}

extension PainationUseCaseBuilder on UseCaseWrapper {
  Widget buildPaginationList<T>({
    Map<String, dynamic>? extraParams,
    BuilderType<T>? listBuilder,
    BuilderType<T>? gridBuilder,
    EdgeInsets? padding,
    Key? builderKey,
    PaginationController<T>? controller,
     CarouselOptions? options,
    ScrollController? scrollController,
    void Function(int id, int index, bool hasChild)? onPressed,
    int? currentId,
    ListType? type,
    Function(dynamic value,int index) ?onChange,
  }) {
    print('asdasdasdsdsadasdasdsad');
    switch (runtimeType) {
      case GetFarmUseCase:
        return _buildFarmList(
            builderKey,
            extraParams??{},
            listBuilder as BuilderType<FarmModel>,
            gridBuilder as BuilderType<FarmModel>,
            controller as PaginationController<FarmModel>,options);

      case GetFieldUseCase:
        return _buildFieldList(
            builderKey,
            extraParams??{},
            listBuilder as BuilderType<FieldModel>,
            gridBuilder as BuilderType<FieldModel>,
            controller as PaginationController<FieldModel>,options);

      case GetFieldDropDownUseCase:
        return _buildFieldListDropdowon(
            builderKey,
            extraParams??{},
            listBuilder as BuilderType<FieldModel>,
            gridBuilder as BuilderType<FieldModel>,
            onChange??(value,index){},
            controller as PaginationController<FieldModel>,options);

      case GetToolUseCase:
        return _buildToolList(
            builderKey,
            extraParams??{},
            listBuilder as BuilderType<ToolFarmModel>,
            gridBuilder as BuilderType<ToolFarmModel>,
            controller as PaginationController<ToolFarmModel>,options);

      case GetTaskUseCase:
        return _buildTaskList(
            builderKey,
            extraParams??{},
            listBuilder as BuilderType<TaskFieldModel>,
            gridBuilder as BuilderType<TaskFieldModel>,
            controller as PaginationController<TaskFieldModel>,options);


      case GetCropUseCase:
        return _buildCropList(
            builderKey,
            extraParams??{},
            listBuilder as BuilderType<CropModel>,
            gridBuilder as BuilderType<CropModel>,
            onChange??(value,index){},
            controller as PaginationController<CropModel>,options);


      case GetCropSeedUseCase:
        return _buildCropSeedList(
            builderKey,
            extraParams??{},
            listBuilder as BuilderType<cropSeed.CropSeed>,
            gridBuilder as BuilderType<cropSeed.CropSeed>,
            onChange??(value,index){},
            controller as PaginationController<cropSeed.CropSeed>,options);

      case GetEmergencyListUseCase:
        return _buildEmergencyList(
            builderKey,
            extraParams??{},
            listBuilder as BuilderType<EmergencyModel>,
            gridBuilder as BuilderType<EmergencyModel>,
            onChange??(value,index){},
            controller as PaginationController<EmergencyModel>,options);
      default:
        return Container();
    }
  }
}




extension Builders on UseCaseWrapper {
  Widget _buildFarmList(Key? builderKey,
      Map<String, dynamic> extraParams,
      BuilderType<FarmModel> listBuilder,
      BuilderType<FarmModel> gridBuilder,

      PaginationController<FarmModel>? controller, CarouselOptions? options,) {
    return PaginationBuilder<FarmModel>(
      key: builderKey,
      type: ListType.list,
      scrollDirection: Axis.vertical,
      flex: 1,
      controller: controller,
      extraParams: extraParams,
      useCase: this,
      listBuilder: listBuilder,
      gridBuilder: gridBuilder,
      options: options,

    );
  }

  Widget _buildFieldList(Key? builderKey,
      Map<String, dynamic> extraParams,
      BuilderType<FieldModel> listBuilder,
      BuilderType<FieldModel> gridBuilder,

      PaginationController<FieldModel>? controller, CarouselOptions? options,) {
    return PaginationBuilder<FieldModel>(
      key: builderKey,
      type: ListType.list,
      scrollDirection: Axis.vertical,
      flex: 10,
      controller: controller,
      extraParams: extraParams,
      useCase: this,
      listBuilder: listBuilder,
      gridBuilder: gridBuilder,
      options: options,

    );
  }


  Widget _buildFieldListDropdowon(Key? builderKey,
      Map<String, dynamic> extraParams,
      BuilderType<FieldModel> listBuilder,
      BuilderType<FieldModel> gridBuilder,
      Function(dynamic value, int index) onChang,
      PaginationController<FieldModel>? controller, CarouselOptions? options,) {
    return PaginationBuilder<FieldModel>(
      key: builderKey,
      type: ListType.dropDown,
      scrollDirection: Axis.vertical,
      flex: 10,
      titleDropDown: 'اختر الحقل',
      controller: controller,
      extraParams: extraParams,
      useCase: this,
      listBuilder: listBuilder,
      gridBuilder: gridBuilder,
      options: options,
      onChange: onChang,

    );
  }

  Widget _buildToolList(Key? builderKey,
      Map<String, dynamic> extraParams,
      BuilderType<ToolFarmModel> listBuilder,
      BuilderType<ToolFarmModel> gridBuilder,

      PaginationController<ToolFarmModel>? controller,
      CarouselOptions? options,) {
    return PaginationBuilder<ToolFarmModel>(
      key: builderKey,
      type: ListType.list,
      scrollDirection: Axis.vertical,
      flex: 10,
      controller: controller,
      extraParams: extraParams,
      useCase: this,
      listBuilder: listBuilder,
      gridBuilder: gridBuilder,
      options: options,

    );
  }


  Widget _buildTaskList(Key? builderKey,
      Map<String, dynamic> extraParams,
      BuilderType<TaskFieldModel> listBuilder,
      BuilderType<TaskFieldModel> gridBuilder,

      PaginationController<TaskFieldModel>? controller,
      CarouselOptions? options,) {
    return PaginationBuilder<TaskFieldModel>(
      key: builderKey,
      type: ListType.list,
      scrollDirection: Axis.vertical,
      flex: 10,
      controller: controller,
      extraParams: extraParams,
      useCase: this,
      listBuilder: listBuilder,
      gridBuilder: gridBuilder,
      options: options,

    );
  }


  Widget _buildCropList(Key? builderKey,
      Map<String, dynamic> extraParams,
      BuilderType<CropModel> listBuilder,
      BuilderType<CropModel> gridBuilder,
      Function(dynamic value, int index) onChang,
      PaginationController<CropModel>? controller,
      CarouselOptions? options,) {
    return PaginationBuilder<CropModel>(
      key: builderKey,
      type: ListType.dropDown,
      scrollDirection: Axis.vertical,
      flex: 10,
      controller: controller,
      extraParams: extraParams,
      useCase: this,
      listBuilder: listBuilder,
      gridBuilder: gridBuilder,
      titleDropDown: 'اختر المحصول',
      options: options,
      onChange: onChang,

    );
  }

  Widget _buildCropSeedList(Key? builderKey,
      Map<String, dynamic> extraParams,
      BuilderType<cropSeed.CropSeed> listBuilder,
      BuilderType<cropSeed.CropSeed> gridBuilder,
      Function(dynamic value, int index) onChang,
      PaginationController<cropSeed.CropSeed>? controller,
      CarouselOptions? options,) {
    return PaginationBuilder<cropSeed.CropSeed>(
      key: builderKey,
      type: ListType.dropDown,
      scrollDirection: Axis.vertical,
      flex: 10,
      titleDropDown: 'اختر البذور',
      controller: controller,
      extraParams: extraParams,
      useCase: this,
      listBuilder: listBuilder,
      gridBuilder: gridBuilder,
      options: options,
      onChange: onChang,

    );
  }

  Widget _buildEmergencyList(Key? builderKey,
      Map<String, dynamic> extraParams,
      BuilderType<EmergencyModel> listBuilder,
      BuilderType<EmergencyModel> gridBuilder,
      Function(dynamic value, int index) onChang,
      PaginationController<EmergencyModel>? controller,
      CarouselOptions? options,) {
    return PaginationBuilder<EmergencyModel>(
      key: builderKey,
      type: ListType.list,
      scrollDirection: Axis.vertical,
      flex: 10,
      controller: controller,
      extraParams: extraParams,
      useCase: this,

      listBuilder: listBuilder,
      gridBuilder: gridBuilder,
      options: options,
      onChange: onChang,
    );
  }
}
