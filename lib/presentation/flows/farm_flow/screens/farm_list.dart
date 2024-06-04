import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/navigation/routes.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/data/models/farm_model.dart';
import 'package:farm_scheduling/domain/usecases/farm_usecase.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/farm_wrappers.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/usecase_wrapper.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/presentation/pagination_builder.dart';
import 'package:farm_scheduling/presentation/custom_widgets/text_translation.dart';
import 'package:farm_scheduling/presentation/flows/auth_flow/blocs/auth_bloc.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FarmListWidget extends StatefulWidget {
  @override
  State<FarmListWidget> createState() => _FarmListWidgetState();
}

class _FarmListWidgetState extends State<FarmListWidget> {
  final ListColor = [
    locator<AppThemeColors>().lightGreen,
    locator<AppThemeColors>().orange
  ];

//   final farmUseCase=locator<GetFarmUseCase>() ;
  final PaginationController<FarmModel> paginationController =
  PaginationController<FarmModel>();
  final authBloc = locator<AuthBloc>();

  @override
  void initState() {
    authBloc.add(GetProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: locator<AppThemeColors>().white,
      body: Column(
        children: [
          Container(
            width: ScreenUtil().screenWidth,
            height: 170.w,
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 20.w, vertical: 15.h),
            child: ItemWidget(
              // image: "lib/assets/images/png/farm.jpeg",
              color: locator<AppThemeColors>().gray,

              onTap: () {
                context.push(RoutesPath.farmListPage);
              },
              child: BlocBuilder<AuthBloc, AuthState>(
                bloc: authBloc,
                builder: (context, state) {
                  return state.user==null? CircularProgressIndicator():Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 30.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            TextTranslation(
                              "الاسم:",
                              withTranslation: false,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  color: locator<AppThemeColors>().dark),
                            ),
                            ScreenUtil().setHorizontalSpacing(20),
                            TextTranslation(state.user?.fullName??'',
                                withTranslation: false,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.sp,
                                    color: locator<AppThemeColors>().dark)),
                          ],
                        ),
                        Row(
                          children: [
                            TextTranslation("الموقع:",
                                withTranslation: false,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: locator<AppThemeColors>().dark,
                                  fontSize: 16.sp,
                                )),
                            ScreenUtil().setHorizontalSpacing(23),
                            TextTranslation(state.user?.address??'',
                                withTranslation: false,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.sp,
                                    color: locator<AppThemeColors>().dark)),
                          ],
                        ),
                        Row(
                          children: [
                            TextTranslation("المنطقة:",
                                withTranslation: false,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    color: locator<AppThemeColors>().dark)),
                            ScreenUtil().setHorizontalSpacing(23),
                            TextTranslation("وادي النصارى",
                                withTranslation: false,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: locator<AppThemeColors>().dark)),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          GetFarmUseCase(farmUseCase: locator<FarmUseCase>())
              .buildPaginationList<FarmModel>(
            controller: paginationController,
            // extraParams: {'isActiveActivity':true},
            listBuilder: (data, index) {
              return InkWell(
                onTap: () {
                  context.push(RoutesPath.farmDetieltPage,
                      extra: {'farmModel': data});
                },
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 20.w, vertical: 15.h),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: data.status?.value == 'PENDING'
                          ? locator<AppThemeColors>().orange
                          : locator<AppThemeColors>().lightGreen,
                    ),
                    // onTap: () {
                    //   context.push(RoutesPath.farmDetieltPage,extra: {'farmModel':data});
                    // },

                    child: Container(
                      width: ScreenUtil().screenWidth,
                      height: 180.h,
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 30.w, vertical: 5.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextTranslation(
                                "اسم المزرعة:",
                                withTranslation: false,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: locator<AppThemeColors>().dark),
                              ),
                              ScreenUtil().setHorizontalSpacing(10),
                              TextTranslation(data.name ?? "",
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
                              TextTranslation("العنوان:",
                                  withTranslation: false,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: locator<AppThemeColors>().dark)),
                              ScreenUtil().setHorizontalSpacing(10),
                              TextTranslation(data.area!.name ?? '',
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
                              TextTranslation("حالة المزرعة:",
                                  withTranslation: false,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: locator<AppThemeColors>().dark)),
                              ScreenUtil().setHorizontalSpacing(10),
                              TextTranslation(data.status?.label ?? "",
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
                              TextTranslation("المساحة:",
                                  withTranslation: false,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: locator<AppThemeColors>().dark)),
                              ScreenUtil().setHorizontalSpacing(10),
                              TextTranslation(data.spaceDenim.toString() ?? "",
                                  withTranslation: false,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: locator<AppThemeColors>().dark)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            gridBuilder: (data, index) {
              print('data: ${data}');
              return SizedBox();
              //   Padding(
              //   padding: EdgeInsetsDirectional.symmetric(
              //       horizontal: 20.w, vertical: 20),
              //   child: GridView.builder(
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2, // Number of columns
              //       mainAxisSpacing: 7.0, // Space between rows
              //       crossAxisSpacing: 30.0.w, // Space between columns
              //     ),
              //   //  itemCount: 2,
              //     itemBuilder: (context, index) {
              //
              //     },
              //   ),
              // );
            },
          ),
        ],
      ),
      // body:
    );
  }
}
