
import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;

  CustomAppBar({
    required this.title,
    this.actions,
    this.leading,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: locator<AppThemeColors>().white,
      title: Text(title,style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold,color: locator<AppThemeColors>().primaryColorLight),),
      actions: actions,
      leading: leading,
      bottom: bottom,
      // flexibleSpace: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       colors: [Colors.blue, Colors.purple],
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //     ),
      //   ),
      // ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight + (bottom?.preferredSize.height ?? 8.0.h));
}