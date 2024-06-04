import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/core/resources/constants.dart';
import 'package:farm_scheduling/data/models/crop_model.dart';
import 'package:farm_scheduling/data/models/crop_seed_model.dart';
import 'package:farm_scheduling/domain/usecases/farm_usecase.dart';
import 'package:farm_scheduling/presentation/custom_widgets/PrimaryButton.dart';
import 'package:farm_scheduling/presentation/custom_widgets/custom_text_field.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/farm_wrappers.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/usecase_wrapper.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/presentation/pagination_builder.dart';
import 'package:farm_scheduling/presentation/custom_widgets/styled_drop_down.dart';
import 'package:farm_scheduling/presentation/custom_widgets/text_translation.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/bloc/farm_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFieldWidget extends StatefulWidget {
  int farmId;
  AddFieldWidget({required this.farmId});
  @override
  State<AddFieldWidget> createState() => _AddFieldWidgetState();
}

class _AddFieldWidgetState extends State<AddFieldWidget> {
  late TextEditingController Controller;
  final PaginationController<CropModel> paginationController =
      PaginationController<CropModel>();

  final PaginationController<CropSeed> paginationController2 =
      PaginationController<CropSeed>();
 // late int cropId = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Controller = TextEditingController();
  }
  final farmBloc=locator<FarmBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 22.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenUtil().setVerticalSpacing(30),
              TextTranslation(
                'طلب إضافة حقل',
                style: TextStyle(
                    color: locator<AppThemeColors>().primaryColorLight,
                    fontSize: 30.sp),
                withTranslation: false,
              ),
              ScreenUtil().setVerticalSpacing(20),
              TextTranslation(
                'عدد الدنومات',
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
              GetCropUseCase(cropUseCase: locator<CropUseCase>())
                  .buildPaginationList<CropModel>(
                onPressed: (id, index, hasChild) {},
                controller: paginationController,
                //  extraParams: {'farm': farmId},
                onChange: (value, index) {
                  print("id use case${value}${index}");
                  //setState(() {
               //   cropId = value;
                  paginationController2.getData({
                    'crop': value,
                  });
                  farmBloc.add(SetFieldEvent(cropId: value));
                  // });
                },
                listBuilder: (data, index) {
                  return SizedBox();
                },
                gridBuilder: (data, index) {
                  print('data: ${data}');
                  return SizedBox();
                },
              ),
              ScreenUtil().setVerticalSpacing(35),
              GetCropSeedUseCase(cropSeedUseCase: locator<CropSeedUseCase>())
                  .buildPaginationList<CropSeed>(
                // onPressed: ( id,  index,  hasChild){
                //   print("id use case${id}");
                //
                // },
                controller: paginationController2,
                extraParams: {'crop': -1},
                onChange: (value, index) {
                  farmBloc.add(SetFieldEvent(cropSeedId: value));
                },
                listBuilder: (data, index) {
                  return SizedBox();
                },
                gridBuilder: (data, index) {
                  print('data: ${data}');
                  return SizedBox();
                },
              ),
              ScreenUtil().setVerticalSpacing(20),
              BlocConsumer<FarmBloc, FarmState>(
                bloc: farmBloc,
                listener: (context, state) {
                  if(state.addFieldStatus==AddFieldSatus.success)
                    {
                      final snackBar = SnackBar(
                        content: Text('تم اضافة حقل بنجاح'),
                        backgroundColor: locator<AppThemeColors>().lightGreen,
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar);
                    }
                  else if(state.addFieldStatus==AddFieldSatus.error)
                    {
                      final snackBar = SnackBar(
                        content: Text(state.error.toString()),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar);
                    }
                },
                builder: (context,state){
                  return state.addFieldStatus==AddFieldSatus.loading?Center(child: CircularProgressIndicator()):
                  Center(
                    child: PrimaryButton(
                      onPress: () {
                        // context.push(RoutesPath.codeScreen);
                        farmBloc.add(AddFieldEvent(numberDenim:int.parse(Controller.text) ,farmId:widget.farmId ));
                      },
                      width: 160.w,
                      hight: 55.h,
                      textStyle:
                      AppTheme.appTextTheme(locator<AppThemeColors>().white)
                          .titleMedium,
                      text: 'إضافة',
                    ),
                  );
                },

              )
            ],
          ),
        ),
      ),
    );
  }
}
