import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemWidget extends StatelessWidget {
  Widget? child;
  String? image;
  Color? color;
  Function()? onTap;
  double? raduce;
  ItemWidget({this.child,this.image,this.color,this.onTap, this.raduce});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(raduce??20.r),
        child: Stack(
          alignment:AlignmentDirectional.center,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                locator<AppThemeColors>().white.withOpacity(color!=null?0.0:0.8), // Adjust opacity as needed
                BlendMode.hardLight,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: color??locator<AppThemeColors>().transparent,
                      borderRadius: BorderRadius.circular(raduce??20.r),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            offset: Offset(1, 1),
                            spreadRadius: 1,
                            color: locator<AppThemeColors>().gray),
                      ],
                    image: image!=null?DecorationImage(
                    image: AssetImage(image!),
                        fit: BoxFit.cover,
                     ):null
                      // border: Border.all(
                      //   color: Theme.of(context).primaryColor,
                      // ),
                      ),

              ),
            ),
            child??SizedBox(),
          ],
        ),
      ),
    );
  }
}
