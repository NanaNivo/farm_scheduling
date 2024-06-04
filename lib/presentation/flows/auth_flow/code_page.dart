import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/core/resources/constants.dart';
import 'package:farm_scheduling/core/validators/base_validator.dart';
import 'package:farm_scheduling/core/validators/required_validator.dart';
import 'package:farm_scheduling/presentation/custom_widgets/PrimaryButton.dart';
import 'package:farm_scheduling/presentation/custom_widgets/custom_text_field.dart';
import 'package:farm_scheduling/presentation/custom_widgets/text_translation.dart';
import 'package:farm_scheduling/presentation/flows/auth_flow/blocs/auth_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodePage extends StatefulWidget {
  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  late TextEditingController emailController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
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
              SizedBox(
                height: ScreenUtil().screenHeight / 1.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 90.h),
                      child: TextTranslation(
                        'يرجى إدخال الرمز',
                        withTranslation: false,
                        style: TextStyle(
                            fontSize: 35.sp,
                            color: locator<AppThemeColors>().primaryColorLight),
                        textAlign: TextAlign.center,
                      ),
                    )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextTranslation(
                          'سيصلك الرمز إلى صندوق الرسائل',
                          withTranslation: false,
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: locator<AppThemeColors>().darkGray),
                        ),
                        ScreenUtil().setVerticalSpacing(20),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: CustomTextField(
                            hintText: "",
                            controller: emailController,
                            colorBorder: locator<AppThemeColors>().transparent,
                            raduceBorder: 10.r,
                            widthBorder: 1.5,
                            onvalidator: (value) {
                              return BaseValidator.validateValue(
                                  value, [RequiredValidator()], true);
                            },
                          ),
                        ),
                        ScreenUtil().setVerticalSpacing(20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextTranslation(
                              'لم يصل الرمز؟',
                              withTranslation: false,
                            ),
                            InkWell(
                              onTap: () {
                                print("on click");
                              },
                              child: TextTranslation(
                                'حاول مرة أخرى!',
                                withTranslation: false,
                                style: TextStyle(
                                  color: locator<AppThemeColors>().primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ScreenUtil().setVerticalSpacing(40),
                        BlocBuilder<AuthBloc, AuthState>(
                          bloc: locator<AuthBloc>(),
                          builder: (context, state) {
                            return state.verifyState == AuthStatusType.loading
                                ? CircularProgressIndicator()
                                : Center(
                                    child: PrimaryButton(
                                      onPress: () {
                                        locator<AuthBloc>()
                                            .setOtpCode(emailController.text);
                                      },
                                      width: 160.w,
                                      hight: 40.h,
                                      textStyle: AppTheme.appTextTheme(
                                              locator<AppThemeColors>().white)
                                          .titleMedium,
                                      text: 'تحقق',
                                    ),
                                  );
                          },
                        )
                      ],
                    ),
                    // ScreenUtil().setVerticalSpacing(70),
                  ],
                ),
              ),
              Center(
                  child: Image.asset(
                "lib/assets/images/png/splashscreen.png",
                width: 40.w,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
