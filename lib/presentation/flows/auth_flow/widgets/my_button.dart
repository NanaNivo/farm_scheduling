import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
        required this.width,
        required this.height,
        required this.myButtonLogic,
        required this.buttonText,
        required this.fontColor,
        required this.fontSize,
        this.icon,
        this.iconColor,
        this.iconSize,required this.decoration});

  final double width;
  final double height;
  // final Color color;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final Function() myButtonLogic;
  final String buttonText;
  final Color fontColor;
  final double fontSize;
  //final bool isCircle;
  final Decoration decoration;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: myButtonLogic,
      child: Container(
        width: width,
        height: height,
        decoration:decoration,
        child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon != null
                    ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Icon(
                    icon,
                    size: iconSize,
                    color: iconColor,
                  ),
                )
                    : SizedBox(),
                Text(
                  buttonText,
                  style: TextStyle(
                      color: fontColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ),
    );
  }
}
