import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/navigation/routes.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/data/models/emrgincy_model.dart';
import 'package:farm_scheduling/data/models/emrgincy_type_mode.dart';
import 'package:farm_scheduling/domain/usecases/emergency_usecase.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/emergency_wrappers.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/usecase_wrapper.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/presentation/pagination_builder.dart';
import 'package:farm_scheduling/presentation/custom_widgets/text_translation.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class EmergincyListWidget extends StatelessWidget {
  // final ListColor = [
  //   locator<AppThemeColors>().lightGreen,
  //   locator<AppThemeColors>().orange
  // ];

//   final farmUseCase=locator<GetFarmUseCase>() ;
  late int? farmId;
  late int? fieldId;

  EmergincyListWidget({this.farmId, this.fieldId});

  final PaginationController<EmergencyModel> paginationController =
      PaginationController<EmergencyModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: locator<AppThemeColors>().white,
      body: Column(
        children: [
          TextTranslation(
            'اضافة طلب  طوارىء',
            withTranslation: false,
            style: TextStyle(
                color: locator<AppThemeColors>().primaryColorLight,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold),
          ),
          ScreenUtil().setVerticalSpacing(5.h),
          SizedBox(
            height: ScreenUtil().screenHeight / 1.52,
            child: GetEmergencyListUseCase(
                    emergencyUseCase: locator<EmergencyUseCase>())
                .buildPaginationList<EmergencyModel>(
              controller: paginationController,
              //  extraParams: {'farm': farmId},
              listBuilder: (data, index) {
                // fieldId= data.id??0;
                return ItemEmergincy(emergencyModel: data);
              },
              gridBuilder: (data, index) {
                print('data: ${data}');
                return SizedBox();
              },
            ),
          ),
          ScreenUtil().setVerticalSpacing(20),
          SizedBox(
            width: 180.w,
            height: 50.h,
            child: ItemWidget(
              raduce: 10.r,
              // image: 'lib/assets/images/png/field-image.png',
              color: locator<AppThemeColors>().primaryColor,
              onTap: () {
                context.push(RoutesPath.emergencyAdd,
                    extra: {'fieldId': fieldId, 'farmId': 0});
              },
              child: Center(
                child: TextTranslation(
                  'اضافة طلب  طوارىء',
                  withTranslation: false,
                  style: TextStyle(
                      color: locator<AppThemeColors>().white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // color: locator<AppThemeColors>().primaryColorLight,
            ),
          )
        ],
      ),
      // body:
    );
  }
}

class ItemEmergincy extends StatelessWidget {
  final EmergencyModel emergencyModel;

  ItemEmergincy({required this.emergencyModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 30.w, vertical: 25.h),
        margin:
            EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: locator<AppThemeColors>().lightGreen,
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
                  "العنوان:",
                  withTranslation: false,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: locator<AppThemeColors>().dark),
                ),
                ScreenUtil().setHorizontalSpacing(20),
                TextTranslation(emergencyModel.title ?? "",
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
                TextTranslation("الحالة:",
                    withTranslation: false,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: locator<AppThemeColors>().dark)),
                ScreenUtil().setHorizontalSpacing(20),
                TextTranslation(emergencyModel.status?.label! ?? "",
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
                TextTranslation(
                    DateFormat('EEEE, MMM d, yyyy').format(
                            DateTime.parse(emergencyModel.createdAt!)) ??
                        "",
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
