import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/blocs/application_bloc/app_bloc.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/presentation/custom_widgets/PrimaryButton.dart';
import 'package:farm_scheduling/presentation/custom_widgets/custom_text_field.dart';
import 'package:farm_scheduling/presentation/custom_widgets/my_divder.dart';
import 'package:farm_scheduling/presentation/custom_widgets/text_translation.dart';
import 'package:farm_scheduling/presentation/flows/auth_flow/blocs/auth_bloc.dart';
import 'package:farm_scheduling/presentation/flows/auth_flow/blocs/image/image_bloc.dart';
import 'package:farm_scheduling/presentation/flows/auth_flow/widgets/my_button.dart';
import 'package:farm_scheduling/presentation/flows/auth_flow/widgets/setting_modal.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/validators/base_validator.dart';
import '../../../../core/validators/required_validator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final bloc = locator<AuthBloc>();
  final appBloc = locator<AppBloc>();
  final userKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    bloc.add(GetProfileEvent());
    super.initState();
  }

  final imageBloc = locator<ImageBloc>();

  // final imageBloc2 = locator<ImageBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.profileState == ProfileState.error) {
          // fullNameController.text = state.userInfo?.fullName??'';
          // addressController.text = state.userInfo?.address??'';
        }
      },
      builder: (context, state) {
        // print("salesman in profile${state.userInfo?.avatar.toString()}");
        return SafeArea(
          child: Scaffold(
            backgroundColor: locator<AppThemeColors>().white,
            body: state.profileState == ProfileState.loading
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SingleChildScrollView(
                      child: Form(
                        key: userKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ScreenUtil().setVerticalSpacing(10.h),

                            state.user?.avatarFileUrl == null ||
                                    state.user!.avatarFileUrl!.isEmpty
                                ? BlocBuilder<ImageBloc, ImageState>(
                                    bloc: imageBloc,
                                    builder: (context, state) {
                                      print("image path${state.imagePath}");
                                      return state.imagePath.isNotEmpty
                                          ? Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.h),
                                              child: Center(
                                                  child: Container(
                                                      // radius: 70.r,
                                                      width: 122.w,
                                                      height: 122.w,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image:
                                                              DecorationImage(
                                                                  image:
                                                                      FileImage(
                                                                    state
                                                                        .showImage!,
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover)))),
                                            )
                                          : Center(
                                              child: MyButton(
                                                  width: 122.w,
                                                  height: 122.w,

                                                  // isCircle: true,
                                                  // color: locator<AppThemeColors>().primaryColor,
                                                  decoration: BoxDecoration(
                                                      //borderRadius: BorderRadius.circular(10.r),
                                                      shape: BoxShape.circle,

                                                      //   color: locator<AppThemeColors>().primaryColor,
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "lib/assets/images/png/user.png"))),
                                                  myButtonLogic: () {
                                                    showModalBottomSheet(
                                                        context: context,
                                                        backgroundColor: locator<
                                                                AppThemeColors>()
                                                            .white,
                                                        builder:
                                                            (BuildContext bc) {
                                                          return SettingModalBottomSheet(
                                                            imageBloc:
                                                                imageBloc,
                                                          );
                                                        });
                                                  },
                                                  buttonText: '',
                                                  fontColor:
                                                      locator<AppThemeColors>()
                                                          .white,
                                                  fontSize: 16.sp),
                                              // PrimaryButton(
                                              //   onPress: () {
                                              //     // locator<AuthBloc>().add(
                                              //     //     SetNumberEvent(emailController.text));
                                              //
                                              //    // ProfileScreen.settingModalBottomSheet(context,imageBloc);
                                              //     showModalBottomSheet(
                                              //     context: context,
                                              //     backgroundColor: locator<AppThemeColors>().white,
                                              //     builder: (BuildContext bc) {
                                              //       return SettingModalBottomSheet();
                                              //     });
                                              //   },
                                              //   width: 200.w,
                                              //   hight: 55.h,
                                              //   textStyle: AppTheme
                                              //       .appTextTheme(
                                              //       locator<AppThemeColors>().white)
                                              //       .titleMedium,
                                              //   text: 'ssss',
                                              // ),
                                            );
                                    },
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: Center(
                                        child: Container(
                                            // radius: 70.r,
                                            width: 122.w,
                                            height: 122.w,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(state
                                                            .user
                                                            ?.avatarFileUrl ??
                                                        ''),
                                                    fit: BoxFit.fill)))),
                                  ),
                            // Image.asset(
                            //   ImagesKeys.personalBig,
                            // ),
                            ScreenUtil().setVerticalSpacing(10.h),
                            Center(
                              child: TextTranslation(
                                'المعلومات الشخصية',
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    color: locator<AppThemeColors>().dark),
                                withTranslation: false,
                              ),
                            ),
                            ScreenUtil().setVerticalSpacing(20.h),
                            TextTranslation(
                              'الاسم',
                              withTranslation: false,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: locator<AppThemeColors>().dark),
                            ),
                            CustomTextField(
                              hintText: state.user?.fullName ?? '',
                              controller: fullNameController,
                              colorBorder:
                                  locator<AppThemeColors>().transparent,
                              raduceBorder: 10.r,
                              widthBorder: 1.5,
                              onvalidator: (value) {
                                return BaseValidator.validateValue(
                                    value,
                                    [
                                      RequiredValidator(),
                                    ],
                                    true);
                              },
                            ),

                            ScreenUtil().setVerticalSpacing(20.h),

                            TextTranslation('العنوان:',
                                withTranslation: false,
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: locator<AppThemeColors>().dark)),
                            CustomTextField(
                              hintText: state.user?.address ?? '',
                              controller: addressController,
                              colorBorder:
                                  locator<AppThemeColors>().transparent,
                              raduceBorder: 10.r,
                              widthBorder: 1.5,
                              onvalidator: (value) {
                                return BaseValidator.validateValue(
                                    value,
                                    [
                                      RequiredValidator(),
                                    ],
                                    true);
                              },
                            ),

                            ScreenUtil().setVerticalSpacing(20.h),
                            MyDivider(),
                            ScreenUtil().setVerticalSpacing(20.h),
                            if (state.updateStatus == UpdateStatus.loading) ...[
                              Center(
                                child: CircularProgressIndicator(),
                              ),
                            ] else ...[
                              Center(
                                child: PrimaryButton(
                                  //  color: Colors.green.shade100,
                                  text: 'تحديث المعلومات',

                                  onPress: () {
                                    if (fullNameController.text.isNotEmpty ||
                                        addressController.text.isNotEmpty ||
                                        imageBloc.state.imagePath.isNotEmpty) {
                                      bloc.add(UpdateProfileEvent(
                                          fullName: fullNameController.text,
                                          address: addressController.text,
                                          avatar: imageBloc.state.imagePath));
                                    }
                                  },
                                  width: 200.w,
                                  hight: 55.h,
                                  textStyle: AppTheme.appTextTheme(
                                          locator<AppThemeColors>().white)
                                      .titleMedium,
                                ),
                              ),
                            ],
                            ScreenUtil().setVerticalSpacing(30.h),
                            Center(
                              child: PrimaryButton(
                                onPress: () {
                                  // locator<AuthBloc>().add(
                                  //     SetNumberEvent(emailController.text));
                                  bloc.add(LogoutEvent());
                                  context.pushReplacement('/auth');
                                },
                                width: 200.w,
                                hight: 55.h,
                                color: locator<AppThemeColors>().firstGradientEnds,
                                textStyle: AppTheme.appTextTheme(
                                        locator<AppThemeColors>().white)
                                    .titleMedium,
                                text: 'تسجيل الخروج',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  static void settingModalBottomSheet(context, ImageBloc imageBloc) {
    // final imageBloc = locator<ImageBloc>();
    showModalBottomSheet(
        context: context,
        backgroundColor: locator<AppThemeColors>().white,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.camera_alt_outlined),
                  title: Text(
                    'التقط صورة من الكميرا',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                  ),
                  onTap: () {
                    imageBloc.add(SetImageCameraEvent());
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: const Icon(Icons.grid_view_rounded),
                title: Text(
                  'اختر صورة من معرض الصور',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                ),
                onTap: () {
                  imageBloc.add(SetImageGalleryEvent());
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
