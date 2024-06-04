import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/navigation/routes.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/data/models/field_model.dart';
import 'package:farm_scheduling/domain/usecases/farm_usecase.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/farm_wrappers.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/usecase_wrapper.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/presentation/pagination_builder.dart';
import 'package:farm_scheduling/presentation/custom_widgets/text_translation.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class FieldListWidget extends StatelessWidget {
  // final ListColor = [
  //   locator<AppThemeColors>().lightGreen,
  //   locator<AppThemeColors>().orange
  // ];

//   final farmUseCase=locator<GetFarmUseCase>() ;
  final int farmId;
  late int fieldId;

  FieldListWidget({required this.farmId});

  final PaginationController<FieldModel> paginationController =
      PaginationController<FieldModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: locator<AppThemeColors>().white,
      body: Column(
        children: [
          Expanded(
            flex: 13,
            child: GetFieldUseCase(fieldUseCase: locator<FieldUseCase>())
                .buildPaginationList<FieldModel>(
              controller: paginationController,
              extraParams: {'farm': farmId},
              listBuilder: (data, index) {
                fieldId = data.id ?? 0;
                return ItemField(fieldModel: data);
              },
              gridBuilder: (data, index) {
                print('data: ${data}');
                return SizedBox();
              },
            ),
          ),
          ScreenUtil().setVerticalSpacing(20),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 160.w,
              height: 50.h,
              child: ItemWidget(
                raduce: 10.r,
                color: locator<AppThemeColors>().primaryColor,
                // image: 'lib/assets/images/png/field-image.png',
                onTap: () {
                  context.push(RoutesPath.addField, extra: {'farmId': farmId});
                },
                child: Center(
                  child: TextTranslation(
                    'طلب اضافة حقل',
                    withTranslation: false,
                    style: TextStyle(
                        color: locator<AppThemeColors>().white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // color: locator<AppThemeColors>().primaryColorLight,
              ),
            ),
          )
        ],
      ),
      // body:
    );
  }
}

class ItemField extends StatelessWidget {
  final FieldModel fieldModel;

  ItemField({required this.fieldModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RoutesPath.fieldDetiel, extra: {'fieldModel': fieldModel});
      },
      child: Container(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 30.w, vertical: 10.h),
          margin:
              EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: fieldModel.status?.value == 'PENDING'
                ? locator<AppThemeColors>().orange
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
                    "اسم المحصول:",
                    withTranslation: false,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: locator<AppThemeColors>().dark),
                  ),
                  ScreenUtil().setHorizontalSpacing(20),
                  TextTranslation(fieldModel.crop?.name ?? "",
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
                  TextTranslation("مساحة الحقل بالدنم:",
                      withTranslation: false,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: locator<AppThemeColors>().dark)),
                  ScreenUtil().setHorizontalSpacing(20),
                  TextTranslation(
                      fieldModel.numberDenim != null
                          ? fieldModel.numberDenim.toString()
                          : '0',
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
                  TextTranslation("تاريخ بدءالزراعة:",
                      withTranslation: false,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: locator<AppThemeColors>().dark)),
                  ScreenUtil().setHorizontalSpacing(20),
                  TextTranslation(fieldModel.agricultureStartDate!=null&&fieldModel.agricultureStartDate!.isNotEmpty?
                      DateFormat('EEEE, MMM d, yyyy').format(DateTime.parse(
                          fieldModel.agricultureStartDate ?? '')):'',
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
                  TextTranslation(fieldModel.adminNote ?? "",
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
                  TextTranslation("التكلفة:",
                      withTranslation: false,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: locator<AppThemeColors>().dark)),
                  ScreenUtil().setHorizontalSpacing(20),
                  TextTranslation(
                      fieldModel.cost != null
                          ? fieldModel.cost.toString()
                          : "0",
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
                  TextTranslation(fieldModel.status?.label ?? "",
                      withTranslation: false,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: locator<AppThemeColors>().dark)),
                ],
              ),
            ],
          )),
    );
  }
}
