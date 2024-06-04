import 'package:farm_scheduling/core/validators/phone_number_validator.dart';
import 'package:farm_scheduling/presentation/flows/auth_flow/blocs/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/navigation/routes.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/core/resources/constants.dart';
import 'package:farm_scheduling/core/validators/base_validator.dart';
import 'package:farm_scheduling/core/validators/email_validator.dart';
import 'package:farm_scheduling/core/validators/password_validators.dart';
import 'package:farm_scheduling/core/validators/required_validator.dart';
import 'package:farm_scheduling/presentation/custom_widgets/CachImage.dart';
import 'package:farm_scheduling/presentation/custom_widgets/PrimaryButton.dart';
import 'package:farm_scheduling/presentation/custom_widgets/custom_text_field.dart';
import 'package:farm_scheduling/presentation/custom_widgets/text_translation.dart';

class LogInPage extends StatefulWidget {
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
          EdgeInsetsDirectional.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //    crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Center(
                  //   child: CachImage(
                  //     url:
                  //         'https://fashion.sheenstores.net/_next/image?url=https%3A%2F%2Fapi.fashion.sheenstores.net%2Fuploads%2FvisualSetting%2FJan-2024%2F28e478a3-ce15-4a90-8978-a5746380af84.png&w=640&q=75',
                  //     width: 200.w,
                  //     hight: 100.h,
                  //   ),
                  // ),
                  Center(
                      child: TextTranslation(
                        'أهلاً بكم في التطبيق',
                        withTranslation: false,
                        style: TextStyle(
                            fontSize: 35.sp,
                            color: locator<AppThemeColors>().primaryColorLight),
                        textAlign: TextAlign.center,
                      )),
                  Column(
                    children: [
                      TextTranslation(
                        'الرجاء ادخال رقم الموبايل',
                        withTranslation: false,
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: locator<AppThemeColors>().darkGray),
                      ),
                      ScreenUtil().setVerticalSpacing(20),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: CustomTextField(
                          hintText: "09********",
                          controller: emailController,
                          colorBorder: locator<AppThemeColors>().transparent,
                          raduceBorder: 10.r,
                          widthBorder: 1.5,

                          onvalidator: (value) {
                            return BaseValidator.validateValue(
                                value,
                                [
                                  PhoneNumValidator(minLength: 9),
                                  RequiredValidator()
                                ],
                                true);
                          },
                        ),
                      ),
                      ScreenUtil().setVerticalSpacing(20),
                      BlocListener<AuthBloc, AuthState>(
                        bloc: locator<AuthBloc>(),
                        listener: (context, state) {
                          if (state.loginState == AuthStatusType.error ||
                              state.verifyState == AuthStatusType.error) {
                            final snackBar = SnackBar(
                              content: Text(state.errorMassege),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 3),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (state.loginState ==
                              AuthStatusType.success) {
                            context.push(RoutesPath.codeScreen);
                          }
                          else if (state.verifyState == AuthStatusType
                              .success) {
                            context.go(RoutesPath.rootPage);
                          }
                        },
                        child: BlocBuilder<AuthBloc, AuthState>(
                          bloc: locator<AuthBloc>(),
                          builder: (context, state) {

                            return state.loginState==AuthStatusType.loading? CircularProgressIndicator(): Center(
                              child: PrimaryButton(
                                onPress: () {
                                  locator<AuthBloc>().add(
                                      SetNumberEvent(emailController.text));
                                },
                                width: 200.w,
                                hight: 55.h,
                                textStyle: AppTheme
                                    .appTextTheme(
                                    locator<AppThemeColors>().white)
                                    .titleMedium,
                                text: 'تسجيل الدخول',
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  ScreenUtil().setVerticalSpacing(20),
                  Column(
                    children: [
                      Center(
                          child: TextTranslation(
                            'ليس لديك حساب؟',
                            withTranslation: false,
                          )),
                      Center(
                          child: InkWell(
                            onTap: () {
                              print("on click");
                            },
                            child: TextTranslation(
                              'انضم إلينا الآن!',
                              withTranslation: false,
                              style: TextStyle(
                                color: locator<AppThemeColors>().primaryColor,
                              ),
                            ),
                          )),
                    ],
                  ),
                  //   ScreenUtil().setVerticalSpacing(500),
                ],
              ),
              Image.asset(
                "lib/assets/images/png/splashscreen.png",
                width: 40.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
