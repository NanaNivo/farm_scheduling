import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/navigation/routes.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/core/resources/constants.dart';
import 'package:farm_scheduling/data/models/farm_model.dart';
import 'package:farm_scheduling/presentation/custom_widgets/PrimaryButton.dart';
import 'package:farm_scheduling/presentation/custom_widgets/text_translation.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FarmDetielWidget extends StatelessWidget {
   final  FarmModel farmModel;
   FarmDetielWidget({required this.farmModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: locator<AppThemeColors>().white,
      body: Padding(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 30.w, vertical: 6.h),
        child: Column(
          children: [
            Row(

              children: [
                TextTranslation(
                  'اسم المزرعة: ',
                  withTranslation: false,
                  style: TextStyle(
                      color: locator<AppThemeColors>().dark,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),

                TextTranslation(farmModel.name??"",
                    withTranslation: false,
                    style: TextStyle(
                        color: locator<AppThemeColors>().dark,
                        fontSize: 18.sp)),
              ],
            ),
            ScreenUtil().setVerticalSpacing(15),
            Row(
              children: [
                TextTranslation('العنوان: ',
                    withTranslation: false,
                    style: TextStyle(
                        color: locator<AppThemeColors>().dark,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp)),
                TextTranslation(farmModel.area?.name??"",
                    withTranslation: false,
                    style: TextStyle(
                        color: locator<AppThemeColors>().dark,
                        fontSize: 18.sp)),
              ],
            ),
            ScreenUtil().setVerticalSpacing(15),
            Row(
              children: [
                TextTranslation('حالة المزرعة :',
                    withTranslation: false,
                    style: TextStyle(
                        color: locator<AppThemeColors>().dark,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp)),
                TextTranslation(farmModel.status?.label??"",
                    withTranslation: false,
                    style: TextStyle(
                        color: locator<AppThemeColors>().dark,
                        fontSize: 18.sp)),
              ],
            ),
            ScreenUtil().setVerticalSpacing(20),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: ScreenUtil().screenWidth,
                    height: 130.w,
                    child: ItemWidget(
                      image: 'lib/assets/images/png/field-image.png',
                      onTap: (){
                        context.push(RoutesPath.fieldList,extra: {'farm':farmModel.id});
                      },
                      child: Center(
                        child: TextTranslation('حقول المزرعة',
                            withTranslation: false,
                            style: TextStyle(
                              color: locator<AppThemeColors>().dark,
                              fontSize: 20.sp,
                                fontWeight: FontWeight.bold
                            )),
                      ),
                   //   color: locator<AppThemeColors>().primaryColorLight,
                    ),
                  ),
                  ScreenUtil().setVerticalSpacing(20),
                  SizedBox(
                    width: ScreenUtil().screenWidth,
                    height: 130.w,
                    child: ItemWidget(
                      onTap: (){
                        context.push(RoutesPath.toolList,extra: {'farm':farmModel.id});
                      },
                      image: 'lib/assets/images/png/istockphoto-502377899-2048x2048.jpg',
                      child: Center(
                        child: TextTranslation(
                          'أدوات المزرعة',
                          withTranslation: false,
                          style: TextStyle(
                            color: locator<AppThemeColors>().dark,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                     // color: locator<AppThemeColors>().primaryColorLight,
                    ),
                  ),
                  ScreenUtil().setVerticalSpacing(20),
                  SizedBox(
                    width: ScreenUtil().screenWidth,
                    height: 130.w,
                    child: ItemWidget(
                      onTap: (){
                        context.push(RoutesPath.emergencyPage,extra: {'farmId':farmModel.id});
                      },
                      image: 'lib/assets/images/png/mainten.jpg',
                      child: Center(
                          child: TextTranslation('طلبات الصيانة',
                              withTranslation: false,
                              style:
                              TextStyle( color: locator<AppThemeColors>().dark,
                                  fontSize: 20.sp,fontWeight: FontWeight.bold))),
                     // color: locator<AppThemeColors>().primaryColorLight,
                    ),
                  ),
                ],
              ),
            ),
       
          //  ScreenUtil().setVerticalSpacing(30),
            // Center(
            //   child: PrimaryButton(
            //     onPress: () {
            //       //    context.push(RoutesPath.);
            //     },
            //     width: 200.w,
            //     hight: 40.h,
            //     textStyle:
            //         AppTheme.appTextTheme(locator<AppThemeColors>().white)
            //             .titleMedium,
            //     text: 'إضافة طلب صيانة',
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
