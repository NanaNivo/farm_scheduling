import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/navigation/routes.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/data/models/field_model.dart';
import 'package:farm_scheduling/presentation/custom_widgets/text_translation.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FieldDetiel extends StatelessWidget
{
  FieldModel fieldModel;
  FieldDetiel({required this.fieldModel});
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Padding(
         padding:
         EdgeInsetsDirectional.symmetric(horizontal: 30.w, vertical: 10.h),
         child: Column(
           children: [
             Row(

               children: [
                 TextTranslation(
                   'اسم المحصول: ',
                   withTranslation: false,
                   style: TextStyle(
                       color: locator<AppThemeColors>().dark,
                       fontWeight:FontWeight.bold ,
                       fontSize: 18.sp),
                 ),

                 TextTranslation(fieldModel.crop?.name??"",
                     withTranslation: false,
                     style: TextStyle(
                         color: locator<AppThemeColors>().dark,
                         fontWeight:FontWeight.normal ,
                         fontSize: 18.sp)),
               ],
             ),
             ScreenUtil().setVerticalSpacing(15),
             Row(
               children: [
                 TextTranslation('مساحة الحقل بالدنم: ',
                     withTranslation: false,
                     style: TextStyle(
                         color: locator<AppThemeColors>().dark,
                         fontWeight:FontWeight.bold ,
                         fontSize: 18.sp)),
                 TextTranslation(fieldModel.numberDenim!=null?fieldModel.numberDenim.toString():"",
                     withTranslation: false,
                     style: TextStyle(
                         color: locator<AppThemeColors>().dark,
                         fontWeight:FontWeight.normal ,
                         fontSize: 18.sp)),
               ],
             ),
             ScreenUtil().setVerticalSpacing(15),
             Row(
               children: [
                 TextTranslation('تاريخ بدء الزراعة :',
                     withTranslation: false,
                     style: TextStyle(
                         color: locator<AppThemeColors>().dark,
                         fontWeight:FontWeight.bold ,
                         fontSize: 18.sp)),
                 TextTranslation(fieldModel.agricultureStartDate??"",
                     withTranslation: false,
                     style: TextStyle(
                         color: locator<AppThemeColors>().dark,
                         fontWeight:FontWeight.normal ,
                         fontSize: 18.sp)),
               ],
             ),
             ScreenUtil().setVerticalSpacing(15),
             Row(
               children: [
                 TextTranslation('الملاحظات :',
                     withTranslation: false,
                     style: TextStyle(
                         color: locator<AppThemeColors>().dark,
                         fontWeight:FontWeight.bold ,
                         fontSize: 18.sp)),
                 TextTranslation(fieldModel.adminNote??"",
                     withTranslation: false,
                     style: TextStyle(
                         color: locator<AppThemeColors>().dark,
                         fontWeight:FontWeight.normal ,
                         fontSize: 18.sp)),
               ],
             ),
             ScreenUtil().setVerticalSpacing(15),
             Row(
               children: [
                 TextTranslation('التكلفة الاجمالية للحقل :',
                     withTranslation: false,
                     style: TextStyle(
                         color: locator<AppThemeColors>().dark,
                         fontWeight:FontWeight.bold ,
                         fontSize: 18.sp)),
                 TextTranslation(fieldModel.cost!=null?fieldModel.cost.toString():"",
                     withTranslation: false,
                     style: TextStyle(
                         color: locator<AppThemeColors>().dark,
                         fontWeight:FontWeight.normal ,
                         fontSize: 18.sp)),
               ],
             ),
             // ScreenUtil().setVerticalSpacing(90),
             // Row(
             //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             //   children: [
             //     SizedBox(
             //       width: 150.w,
             //       height: 190.w,
             //       child: ItemWidget(
             //         image: 'lib/assets/images/png/field-image.png',
             //         onTap: (){
             //           context.push(RoutesPath.fieldList,extra: {'farm':farmModel.id});
             //         },
             //         child: Center(
             //           child: TextTranslation('حقول المزرعة',
             //               withTranslation: false,
             //               style: TextStyle(
             //                   color: locator<AppThemeColors>().dark,
             //                   fontSize: 20.sp,
             //                   fontWeight: FontWeight.bold
             //               )),
             //         ),
             //         //   color: locator<AppThemeColors>().primaryColorLight,
             //       ),
             //     ),
             //     SizedBox(
             //       width: 150.w,
             //       height: 190.w,
             //       child: ItemWidget(
             //         onTap: (){
             //           context.push(RoutesPath.toolList,extra: {'farm':farmModel.id});
             //         },
             //         image: 'lib/assets/images/png/istockphoto-502377899-2048x2048.jpg',
             //         child: Center(
             //           child: TextTranslation(
             //             'أدوات المزرعة',
             //             withTranslation: false,
             //             style: TextStyle(
             //                 color: locator<AppThemeColors>().dark,
             //                 fontSize: 20.sp,
             //                 fontWeight: FontWeight.bold
             //             ),
             //           ),
             //         ),
             //         // color: locator<AppThemeColors>().primaryColorLight,
             //       ),
             //     ),
             //   ],
             // ),
             // ScreenUtil().setVerticalSpacing(20),
             // Row(
             //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             //   children: [
             //     SizedBox(
             //       width: 150.w,
             //       height: 190.w,
             //       child: ItemWidget(
             //         onTap: (){
             //           context.push(RoutesPath.emergencyPage,extra: {'farmId':farmModel.id});
             //         },
             //         image: 'lib/assets/images/png/mainten.jpg',
             //         child: Center(
             //             child: TextTranslation('طلبات الصيانة',
             //                 withTranslation: false,
             //                 style:
             //                 TextStyle( color: locator<AppThemeColors>().dark,
             //                     fontSize: 20.sp,fontWeight: FontWeight.bold))),
             //         color: locator<AppThemeColors>().primaryColorLight,
             //       ),
             //     ),
             //     Container(
             //       width: 150.w,
             //       height: 190.w,
             //       child: ItemWidget(
             //         //  image: 'lib/assets/images/png/mainten.jpg',
             //         color: locator<AppThemeColors>().lightGreen,
             //         onTap: (){
             //           context.push(RoutesPath.emergencyAdd,extra: {'farmId':farmModel.id});
             //         },
             //         child: Center(
             //             child: TextTranslation('إضافة طلب صيانة',
             //                 withTranslation: false,
             //                 textAlign: TextAlign.center,
             //                 style:
             //                 TextStyle(
             //                     color: locator<AppThemeColors>().dark,
             //                     fontSize: 20.sp,fontWeight: FontWeight.bold))),
             //
             //       ),
             //     ),
             //   ],
             // ),
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
             ScreenUtil().setVerticalSpacing(40),
             Column(
               children: [
                 SizedBox(
                   width: ScreenUtil().screenWidth,
                   height: 110.w,
                   child: ItemWidget(
                     onTap: (){
                       context.push(RoutesPath.fieldTask,extra: {'field':fieldModel.id});
                     },
                     image: 'lib/assets/images/png/field-image.png',
                     child: Center(
                       child: TextTranslation(
                         'مهام الحقل',
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
                 ScreenUtil().setVerticalSpacing(30),
                 Container(
                   width: ScreenUtil().screenWidth,
                   height: 110.w,
                   child: ItemWidget(
                     //  image: 'lib/assets/images/png/mainten.jpg',
                     image: 'lib/assets/images/png/field-image.png',
                    // color: locator<AppThemeColors>().lightGreen,
                     onTap: (){
                       context.push(RoutesPath.emergencyAdd,extra: {'fieldId':fieldModel.id});
                     },
                     child: Center(
                         child: TextTranslation('إضافة طلب صيانة',
                             withTranslation: false,
                             textAlign: TextAlign.center,
                             style:
                             TextStyle(
                                 color: locator<AppThemeColors>().dark,
                                 fontSize: 20.sp,fontWeight: FontWeight.bold))),

                   ),
                 ),
               ],
             )

           ],
         ),
       ),
     );
  }

}