import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/core/resources/constants.dart';
import 'package:farm_scheduling/data/models/task_field_model.dart';
import 'package:farm_scheduling/domain/usecases/farm_usecase.dart';
import 'package:farm_scheduling/presentation/custom_widgets/PrimaryButton.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/farm_wrappers.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/entity/usecase_wrapper.dart';
import 'package:farm_scheduling/presentation/custom_widgets/infinite_list_view/presentation/pagination_builder.dart';
import 'package:farm_scheduling/presentation/custom_widgets/text_translation.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/bloc/farm_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldTaskWidget extends StatefulWidget {
  final int fieldId;

  FieldTaskWidget({required this.fieldId});

  @override
  State<FieldTaskWidget> createState() => _FieldTaskWidgetState();
}

class _FieldTaskWidgetState extends State<FieldTaskWidget>
    with TickerProviderStateMixin {
  bool _isStretched = false;

  void _toggleStretch(int index) {
    if (controllers[index].status == AnimationStatus.completed) {
      controllers[index].reverse();
    } else {
      controllers[index].forward();
    }
  }

  @override
  void dispose() {
    // _controller.dispose();
    // _controller2.dispose();
    // _controller3.dispose();
    super.dispose();
  }

  List<AnimationController> controllers = [];
  List<Animation<double>> heightAnimations = [];

  final farmBloc = locator<FarmBloc>();

  final PaginationController<TaskFieldModel> paginationController =
      PaginationController<TaskFieldModel>();

  @override
  void initState() {
    super.initState();

    // _controller2 = AnimationController(
    //   duration: const Duration(milliseconds: 300),
    //   vsync: this,
    // );
    // _controller3 = AnimationController(
    //   duration: const Duration(milliseconds: 300),
    //   vsync: this,
    // );
    //
    //
    //
    // _heightAnimation2 =
    //     Tween<double>(begin: 45.0.h, end: 226.0.h).animate(_controller2);
    //
    // _heightAnimation3=
    //     Tween<double>(begin: 45.0.h, end: 226.0.h).animate(_controller3);
  }

  @override
  Widget build(BuildContext context) {
    //  print("animation value${_heightAnimation.value}");
    return Scaffold(
      backgroundColor: locator<AppThemeColors>().white,
      body: GetTaskUseCase(taskUseCase: locator<TaskUseCase>())
          .buildPaginationList<TaskFieldModel>(
        controller: paginationController,
        extraParams: {'field': widget.fieldId},
        listBuilder: (data, index) {
          late AnimationController _controller = AnimationController(
            duration: const Duration(milliseconds: 300),
            vsync: this,
          );
          late Animation<double> _heightAnimation =
              Tween<double>(begin: 50.0.h, end: 290.0.h).animate(_controller);
          controllers.add(_controller);
          heightAnimations.add(_heightAnimation);
          if(data.taskStatus?.id==6)
            {
             _controller.forward();
            }
          return Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w,vertical: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w,vertical: 5.h),
                  child: TextTranslation(
                    data.name ?? '',
                    withTranslation: false,
                    style: TextStyle(
                        color: locator<AppThemeColors>().primaryColorLight,
                        fontSize: 20.sp),
                  ),
                ),
                ScreenUtil().setVerticalSpacing(4),
                GestureDetector(
                  onTap: () {
                    _toggleStretch(index);
                  },
                  child: AnimatedBuilder(
                      animation: heightAnimations[index],
                      builder: (context, child) {
                        return Container(
                          height: heightAnimations[index].value,
                          // Adjust these values as needed
                          //    decoration: BoxDecoration(),
                          decoration: BoxDecoration(
                              color: controllers[index].isCompleted
                                  ? locator<AppThemeColors>().lightGreen
                                  : locator<AppThemeColors>().gray,
                              borderRadius: controllers[index].isCompleted
                                  ? BorderRadius.circular(30.r)
                                  : BorderRadius.circular(8.r)),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: 15.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                    //  color: Colors.orange,
                                    color: locator<AppThemeColors>().gray,
                                    borderRadius: controllers[index].isCompleted
                                        ? BorderRadius.circular(30.r)
                                        : BorderRadius.circular(8.r)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        TextTranslation(
                                          'الحالة :',
                                          withTranslation: false,
                                          style: TextStyle(
                                              color: locator<AppThemeColors>()
                                                  .dark,
                                              fontSize: 16.sp),
                                        ),
                                        TextTranslation(
                                          data.taskStatus?.statusName ?? '',
                                          withTranslation: false,
                                          style: TextStyle(
                                              color: locator<AppThemeColors>()
                                                  .dark,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    !controllers[index].isCompleted
                                        // ? CircleAvatar(
                                        //     backgroundColor:
                                        //         locator<AppThemeColors>()
                                        //             .darkGray,
                                        //     radius: 7.r,
                                        //   )
                                    ? Icon(
                                      Icons.arrow_back_ios_new_outlined,

                                      color: locator<AppThemeColors>()
                                          .darkGray,
                                      size: 20.sp,
                                    )
                                        : Icon(
                                            Icons.keyboard_arrow_down_sharp,

                                            color: locator<AppThemeColors>()
                                                .darkGray,
                                      size: 20.sp,
                                          )
                                  ],
                                ),
                              ),
                              if (controllers[index].isCompleted)
                                Container(
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 15.w),
                                  decoration: BoxDecoration(
                                      color:
                                          locator<AppThemeColors>().lightGreen,
                                      borderRadius:
                                          controllers[index].isCompleted
                                              ? BorderRadius.circular(30.r)
                                              : BorderRadius.circular(8.r)),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ScreenUtil().setVerticalSpacing(20),
                                      TextTranslation(
                                        'تفاصيل المهمة:',
                                        withTranslation: false,
                                        textAlign: TextAlign?.start,
                                        style: TextStyle(
                                            color: locator<AppThemeColors>()
                                                .primaryColorLight,
                                            fontSize: 18.sp),
                                      ),
                                      Row(
                                        children: [
                                          TextTranslation(
                                            'عدد الايام: ',
                                            withTranslation: false,
                                            style: TextStyle(
                                                color: locator<AppThemeColors>()
                                                    .dark,
                                                fontSize: 18.sp),
                                          ),
                                          TextTranslation(
                                            data.durationDay != null
                                                ? data.durationDay.toString()
                                                : '0',
                                            withTranslation: false,
                                            style: TextStyle(
                                                color: locator<AppThemeColors>()
                                                    .dark,
                                                fontSize: 18.sp),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          TextTranslation(
                                            'تاريخ البدء',
                                            withTranslation: false,
                                            style: TextStyle(
                                                color: locator<AppThemeColors>()
                                                    .dark,
                                                fontSize: 18.sp),
                                          ),
                                          TextTranslation(
                                            data.startDate != null
                                                ? data.startDate.toString()
                                                : '',
                                            withTranslation: false,
                                            style: TextStyle(
                                                color: locator<AppThemeColors>()
                                                    .dark,
                                                fontSize: 18.sp),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          TextTranslation(
                                            'الكلفة: ',
                                            withTranslation: false,
                                            style: TextStyle(
                                                color: locator<AppThemeColors>()
                                                    .dark,
                                                fontSize: 18.sp),
                                          ),
                                          TextTranslation(
                                            data.cost != null
                                                ? data.cost.toString()
                                                : '',
                                            withTranslation: false,
                                            style: TextStyle(
                                                color: locator<AppThemeColors>()
                                                    .dark,
                                                fontSize: 18.sp),
                                          ),
                                        ],
                                      ),
                                      ScreenUtil().setVerticalSpacing(20),
                                      BlocConsumer<FarmBloc, FarmState>(
                                        bloc: farmBloc,
                                          listener: (context, state) {
                                        if (state.updateFieldStatus ==
                                            UpdateFieldStatus.success) {
                                          paginationController.getData({});
                                        }
                                      }, builder: (context, state) {
                                        return state.updateFieldStatus ==
                                                UpdateFieldStatus.loading
                                            ? 
                                        Center(child: CircularProgressIndicator())
                                            : Center(
                                                child: PrimaryButton(
                                                  onPress: () {
                                                    //  context.push(RoutesPath.codeScreen);
                                                    if (data.taskStatus?.id ==
                                                        6) {
                                                      farmBloc.add(
                                                          UpdateStatusField(
                                                              taskStatus: 2,idField: data.id!));
                                                    }
                                                  },
                                                  color: data.taskStatus?.id != 6?locator<AppThemeColors>().gray:locator<AppThemeColors>().primaryColor,
                                                  width: 140.w,
                                                  hight: 40.h,
                                                  borderRadiuse:
                                                      BorderRadius.circular(
                                                          30.r),
                                                  textStyle: AppTheme
                                                          .appTextTheme(
                                                      data.taskStatus?.id != 6?locator<AppThemeColors>().primaryColor:
                                                      locator<
                                                                  AppThemeColors>()
                                                              .white)
                                                      .titleMedium,
                                                  text: 'تأكيد المهمة',
                                                ),
                                              );
                                      }),
                                      ScreenUtil().setVerticalSpacing(20),
                                    ],
                                  ),
                                )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        },
        gridBuilder: (data, index) {
          print('data: ${data}');
          return SizedBox();
        },
      ),
    );
  }
}
