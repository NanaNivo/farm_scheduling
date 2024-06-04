import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/data/models/field_model.dart';
import 'package:farm_scheduling/data/models/tool_farm_model.dart';
import 'package:farm_scheduling/domain/usecases/farm_usecase.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/farm_wrappers.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/usecase_wrapper.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/presentation/pagination_builder.dart';
import 'package:farm_scheduling/presentation/custom_widgets/text_translation.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ToolListWidget extends StatelessWidget {
  // final ListColor = [
  //   locator<AppThemeColors>().lightGreen,
  //   locator<AppThemeColors>().orange
  // ];

//   final farmUseCase=locator<GetFarmUseCase>() ;
  final int farmId;

  ToolListWidget({required this.farmId});

  final PaginationController<ToolFarmModel> paginationController =
  PaginationController<ToolFarmModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: locator<AppThemeColors>().white,
      body:
      Column(
        children: [
          GetToolUseCase(toolUseCase: locator<ToolUseCase>())
              .buildPaginationList<ToolFarmModel>(
            controller: paginationController,
            extraParams: {'farm': farmId},
            listBuilder: (data, index) {
              return ToolItem(toolFarmModel: data);
            },
            gridBuilder: (data, index) {
              print('data: ${data}');
              return SizedBox();
            },
          ),




        ],
      ),
      // body:
    );
  }
}

class ToolItem extends StatelessWidget {
  final ToolFarmModel toolFarmModel;

  ToolItem({required this.toolFarmModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 30.w,vertical: 15.h),
        margin: EdgeInsetsDirectional.symmetric(horizontal: 20.w,vertical: 10.h),
        decoration: BoxDecoration(
          color
              : locator<AppThemeColors>().lightGreen,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextTranslation(
                  "اسم الاداة:",
                  withTranslation: false,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: locator<AppThemeColors>().dark),
                ),
                ScreenUtil().setHorizontalSpacing(20),
                TextTranslation(toolFarmModel.name ?? "",
                    withTranslation: false,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: locator<AppThemeColors>().dark)),
              ],
            ),
            ScreenUtil().setVerticalSpacing(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextTranslation("الكمية",
                    withTranslation: false,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: locator<AppThemeColors>().dark)),
                ScreenUtil().setHorizontalSpacing(20),
                TextTranslation(toolFarmModel.quantity!=null?toolFarmModel.quantity.toString() : '0',
                    withTranslation: false,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: locator<AppThemeColors>().dark)),
              ],
            ),
            ScreenUtil().setVerticalSpacing(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextTranslation("تاريخ الانشاء:",
                    withTranslation: false,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: locator<AppThemeColors>().dark)),
                ScreenUtil().setHorizontalSpacing(20),

                TextTranslation(toolFarmModel.createdAt!=null?DateFormat().format(DateTime.parse(toolFarmModel.createdAt!)): "",
                    withTranslation: false,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: locator<AppThemeColors>().dark)),
              ],
            ),
            ScreenUtil().setVerticalSpacing(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextTranslation("الملاحظات:",
                    withTranslation: false,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: locator<AppThemeColors>().dark)),
                ScreenUtil().setHorizontalSpacing(20),
                TextTranslation(toolFarmModel.note ?? "",
                    withTranslation: false,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: locator<AppThemeColors>().dark)),
              ],
            ),
            ScreenUtil().setVerticalSpacing(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextTranslation("الوصف:",
                    withTranslation: false,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: locator<AppThemeColors>().dark)),
                ScreenUtil().setHorizontalSpacing(20),
                TextTranslation(toolFarmModel.description!=null?toolFarmModel.description!:'',
                    withTranslation: false,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: locator<AppThemeColors>().dark)),
              ],
            ),

          ],
        ));
  }
}
