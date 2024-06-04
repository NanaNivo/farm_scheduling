import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/presentation/custom_widgets/custom_drop_down.dart';
import 'package:farm_scheduling/presentation/custom_widgets/text_translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DropDownModel {
  final dynamic? id;
  final String? name;

  const DropDownModel({@required this.id, @required this.name});

  @override
  bool operator ==(Object other) {
    return other is DropDownModel && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}

class StyledDropDown extends StatelessWidget {
  const StyledDropDown({ this.data, this.title,  this.onChange, this.selectedData});

  final String? title;
  final List<DropDownModel>? data;
  final String? selectedData;
  final void Function(dynamic, int)? onChange;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.symmetric(horizontal: 0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextTranslation(
            title??'',
            withTranslation: false,
            style: TextStyle(
                color: locator<AppThemeColors>().primaryColorLight,
                fontWeight: FontWeight.normal,
                fontSize: 20.sp,),
          ),
          ScreenUtil().setVerticalSpacing(10),
          CustomDropdown(
              textOnly: true,
              onChange: onChange!,
              // prefixIcon: const Padding(
              //   padding: EdgeInsetsDirectional.only(end: 8.0),
              //   child: Icon(Icons.account_balance_outlined),
              // ),
              icon: Icon(Icons.arrow_drop_down_sharp,color: locator<AppThemeColors>().darkGray,size: 30.sp,),

              dropdownButtonStyle: DropdownButtonStyle(
                selectedTextStyle: TextStyle(
                    color: locator<AppThemeColors>().dark, fontWeight: FontWeight.bold),
                borderRadius: BorderRadius.circular(15.spMax),
                width: MediaQuery.of(context).size.width,
                selectedColor: locator<AppThemeColors>().secondaryColor,
                padding:  EdgeInsets.symmetric(vertical: 7.h, horizontal: 8.w),
                elevation: 4,
                shadowColor: locator<AppThemeColors>().transparent,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                backgroundColor: locator<AppThemeColors>().gray,
                primaryColor: locator<AppThemeColors>().gray,
              ),
              dropdownStyle: DropdownStyle(
                borderRadius: BorderRadius.circular(15.spMax),
                elevation: 6,
                padding: EdgeInsets.all(5),
              ),
              items: data!
                  .map(
                    (item) => DropdownItem(
                  value:item.id ,
                  item: item.name,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item.name!,style: TextStyle(color: locator<AppThemeColors>().dark,fontSize: 16.sp),),
                  ),
                ),
              )
                  .toList(),
              child: Row(
                children: [
                  Text(
                    selectedData??'',
                    style: TextStyle(color: locator<AppThemeColors>().dark),
                  )
                ],
              )),

        ],
      ),
    );
  }
}