import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/navigation/routes.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/presentation/custom_widgets/text_translation.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FarmHome extends StatefulWidget {
  @override
  State<FarmHome> createState() => _FarmHomeState();
}

class _FarmHomeState extends State<FarmHome> {
  final titleList = ['الرئيسية', 'مزارعي'];
  final homWidgets = [
    Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              TextTranslation("الاسم:", withTranslation: false,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,
                    color: locator<AppThemeColors>().dark),),
              ScreenUtil().setHorizontalSpacing(20),
              TextTranslation("أبو عبدو", withTranslation: false,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,
                      color: locator<AppThemeColors>().dark)),
            ],
          ),
          Row(
            children: [
              TextTranslation("المحافظة:", withTranslation: false,
                  style: TextStyle(fontWeight: FontWeight.bold,
                      color: locator<AppThemeColors>().dark,fontSize: 16.sp,)),
              ScreenUtil().setHorizontalSpacing(23),
              TextTranslation("حمص", withTranslation: false,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,
                      color: locator<AppThemeColors>().dark)),
            ],
          ),
          Row(
            children: [
              TextTranslation("المنطقة:", withTranslation: false,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp,
                      color: locator<AppThemeColors>().dark)),
              ScreenUtil().setHorizontalSpacing(23),
              TextTranslation("وادي النصارى", withTranslation: false,
                  style: TextStyle(fontWeight: FontWeight.bold,
                      color: locator<AppThemeColors>().dark)),
            ],
          ),

        ],
      ),
    ),
    SizedBox(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: locator<AppThemeColors>().white,
      body: ListView.builder(
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 2, // Number of columns
        //   mainAxisSpacing: 3.0, // Space between rows
        //   crossAxisSpacing: 3.0.w, // Space between columns
        // ),
        itemCount: 2,
        itemBuilder: (context, index) {
          return    Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 30.w,vertical: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextTranslation(titleList[index], withTranslation: false,
                  style: TextStyle(
                      color: locator<AppThemeColors>().primaryColor, fontSize: 23.sp),),
                Container(width: ScreenUtil().screenWidth, height: 170.w,child: ItemWidget(image: "lib/assets/images/png/farm.jpeg",onTap: (){
                  context.push(RoutesPath.farmListPage);

                },child:homWidgets[index] ,),),
              ],
            ),
          );

            InkWell(child: homWidgets[index]);
        },
      ),
    );
  }
}