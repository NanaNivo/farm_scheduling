import 'package:farm_scheduling/presentation/flows/auth_flow/blocs/image/image_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingModalBottomSheet extends StatelessWidget
{
  final imageBloc;
  SettingModalBottomSheet({this.imageBloc});
  @override
  Widget build(BuildContext context) {
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

  }

}
