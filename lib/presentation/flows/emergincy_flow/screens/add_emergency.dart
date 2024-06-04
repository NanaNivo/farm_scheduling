import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/core/resources/constants.dart';
import 'package:farm_scheduling/data/models/field_model.dart';
import 'package:farm_scheduling/domain/usecases/farm_usecase.dart';
import 'package:farm_scheduling/presentation/custom_widgets/PrimaryButton.dart';
import 'package:farm_scheduling/presentation/custom_widgets/custom_text_field.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/farm_wrappers.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/usecase_wrapper.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/presentation/pagination_builder.dart';
import 'package:farm_scheduling/presentation/custom_widgets/styled_drop_down.dart';
import 'package:farm_scheduling/presentation/custom_widgets/text_translation.dart';
import 'package:farm_scheduling/presentation/flows/emergincy_flow/bloc/emergency_bloc.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/screens/field_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEmergencyWidget extends StatefulWidget {
  int farmId;
  int fieldId;

  AddEmergencyWidget({required this.farmId, required this.fieldId});

  @override
  State<AddEmergencyWidget> createState() => _AddEmergencydWidgetState();
}

class _AddEmergencydWidgetState extends State<AddEmergencyWidget> {
  late TextEditingController Controller;
  late TextEditingController Controller2;
  late TextEditingController Controller3;
  final  emergencyBloc=locator<EmergencyBloc>();

  final PaginationController<FieldModel> paginationController =
  PaginationController<FieldModel>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('farmId${widget.farmId}${widget.fieldId}');
    Controller = TextEditingController();
    Controller2 = TextEditingController();
    Controller3 = TextEditingController();
    emergencyBloc.add(GetEmergencyTypeEvent());
  }

  // final farmBloc=locator<FarmBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: locator<AppThemeColors>().white,
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 25.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ScreenUtil().setVerticalSpacing(30),
            // TextTranslation(
            //   widget.farmId!=0?'اضافة طلب صيانة':'اضافة طلب طواريء',
            //   style: TextStyle(
            //       color: locator<AppThemeColors>().primaryColorLight,
            //       fontSize: 30.sp),
            //   withTranslation: false,
            // ),
            ScreenUtil().setVerticalSpacing(20),
            TextTranslation(
              'عنوان الطلب',
              style: TextStyle(
                  color: locator<AppThemeColors>().primaryColorLight,
                  fontSize: 18.sp),
              withTranslation: false,
            ),
            CustomTextField(
              hintText: "",
              controller: Controller,
              colorBorder: locator<AppThemeColors>().transparent,
              raduceBorder: 10.r,
              widthBorder: 1.5,

              onvalidator: (value) {
                // return BaseValidator.validateValue(
                //     value, [PhoneNumValidator(minLength: 9), RequiredValidator()], true);
              },
            ),


            ScreenUtil().setVerticalSpacing(20),

            if(widget.farmId==0)
              ...[
                GetFieldDropDownUseCase(fieldUseCase: locator<FieldUseCase>())
                    .buildPaginationList<FieldModel>(
                  controller: paginationController,
                  //  extraParams: {'farm': farmId},
                  onChange: (value,index) {
                    print("value drop down${value}");
                    //   widget.fieldId=value;
                    emergencyBloc.add(AddFieldId(fieldId: value));
                  },
                  listBuilder: (data, index) {
                    //  fieldId= data.id??0;
                    return SizedBox();
                  },
                  gridBuilder: (data, index) {
                    print('data: ${data}');
                    return SizedBox();
                  },
                ),
                BlocBuilder<EmergencyBloc,EmergencyState>(
                    bloc: emergencyBloc,
                    builder: (context,state) {
                      // print("widget.fieldId${widget.farmId}${state.emergencyStatus}");
                      if(state.fieldId!=null&&state.emergencyStatus==EmergencyStatus.success)
                        return   Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ScreenUtil().setVerticalSpacing(20),
                              StyledDropDown(
                                // key: ObjectKey(TranslationsKeys.universityType),
                                  title: 'اختر النوع',
                                  selectedData: '',
                                  onChange: (value, index) {
                                    print("value in type${value}");
                                    emergencyBloc.add(EmergencyTypeEvent(value: value));
                                  },
                                  data: state.emergencyList?.data?.map((e) =>
                                      DropDownModel(
                                          id: e.value, name: e.label))
                                      .toList()),
                            ]
                        );
                      else
                      {
                        return SizedBox();
                      }
                    }),
              ],
            ScreenUtil().setVerticalSpacing(20),
            TextTranslation(
              'الملاحظات',
              textAlign:TextAlign.start ,
              style: TextStyle(
                  color: locator<AppThemeColors>().primaryColorLight,
                  fontSize: 18.sp),
              withTranslation: false,
            ),
            CustomTextField(
              hintText: "",
              controller: Controller2,
              colorBorder: locator<AppThemeColors>().transparent,
              raduceBorder: 10.r,
              widthBorder: 1.5,

              onvalidator: (value) {

                // return BaseValidator.validateValue(
                //     value, [PhoneNumValidator(minLength: 9), RequiredValidator()], true);
              },
            ),
            ScreenUtil().setVerticalSpacing(40),
            Center(
              child: PrimaryButton(
                onPress: () {
              emergencyBloc.add(AddEmergencyEvent(title: Controller.text, note: Controller2.text,farmId:widget.farmId ,));
                },
                width: 200.w,
                hight: 50.h,
                textStyle: AppTheme
                    .appTextTheme(
                    locator<AppThemeColors>().white)
                    .titleMedium,
                text:  widget.farmId!=0?'اضافة طلب صيانة':'اضافة طلب طواريء',
              ),
            )
          ],
        ),
      ),
    );
  }
}