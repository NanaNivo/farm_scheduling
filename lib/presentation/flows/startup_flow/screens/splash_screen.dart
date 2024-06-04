import 'package:farm_scheduling/presentation/custom_widgets/text_translation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:farm_scheduling/app+injection/app.dart';
import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/helper/screen_util/screen_helper.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/core/resources/constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/blocs/application_bloc/app_bloc.dart';

import '../../../custom_widgets/custom_header/custom_header.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  final appBloc = locator<AppBloc>();

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1400));
    _animation = Tween(begin:0, end: 300.0.h).animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return

     Scaffold(
        body: SafeArea(
          bottom: true,
          top: false,
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().screenHeight/1.8,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _animation,
                      child: Image.asset(
                        ImagesKeys.splashLogo,
                        width: 150.w,
                        //  color: locator<AppThemeColors>().light,
                      ),
                      builder: (context, child) {
                        return Positioned(
                          top: _animation.value*1.0,
                          child: child!,
                        );
                      },
                    ),
                  ],
                ),
              ),
              TextTranslation('المزرعة',withTranslation: false,style: TextStyle(fontSize: 50.sp,fontWeight:FontWeight.bold ),)
            ],
          ),
        ),
      );

  }
}

class GradientBackground extends StatelessWidget {
  final Color beginColor;
  final Color endColor;
  final Widget child;

  const GradientBackground({
    required this.beginColor,
    required this.endColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            beginColor,
            endColor,
          ],
        ),
      ),
      child: child,
    );
  }
}


