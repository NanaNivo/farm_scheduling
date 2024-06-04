import 'package:farm_scheduling/presentation/custom_widgets/custom_app_bar.dart';
import 'package:farm_scheduling/presentation/flows/auth_flow/profile_screen.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/screens/farm_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/app+injection/app.dart';
import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/blocs/application_bloc/app_bloc.dart';
import 'package:farm_scheduling/core/navigation/routes.dart';
import 'package:farm_scheduling/core/resources/colors.dart';
import 'package:farm_scheduling/core/resources/constants.dart';
import 'package:farm_scheduling/presentation/flows/root_flow/bloc/root_cubit.dart';
import 'package:farm_scheduling/presentation/flows/root_flow/widget/primary_button.dart';





class NavigationController {
  final List<NavigationItem> navigationItems = [

    NavigationItem(
      title: 'حسابي',
      enabledIcon: ImagesKeys.user,
      disabledIcon: ImagesKeys.user,
      page: ProfileScreen(),
    ),
    NavigationItem(
      title: 'مزارعي',
      enabledIcon: ImagesKeys.farmers,
      disabledIcon: ImagesKeys.farmers,
      page: FarmHome(),
    ),
    NavigationItem(
      title: 'تنبيهاتي',
      enabledIcon: ImagesKeys.notification,
    //  disabledIcon: ImagesKeys.notification,
      page: Container(),
    ),
    NavigationItem(
      title: 'طلباتي',
      enabledIcon: ImagesKeys.imergency,
      disabledIcon: ImagesKeys.imergency,
      page: Container(),
    ),

  ];

  int _currentIndex = 0;

  NavigationItem get currentNavigationItem => navigationItems[_currentIndex];

  int get currentIndex => _currentIndex;

  List<BottomNavigationBarItem> get bottomNavigationBarItems =>
      navigationItems
          .map((item) =>
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 5.h),
                  child: Container(
                    //width: 300,
                  height: 30.h,
                 //  decoration: BoxDecoration(
                 //      image:DecorationImage(
                 //          image: AssetImage(item.disabledIcon,),
                 //          fit:BoxFit.contain
                 //      )
                 // // child: Image.asset(  item.disabledIcon,width: 70.w,color:Colors.white ,height: 80.h,
                 //    ),
                    child:item.disabledIcon==null? Icon(Icons.notifications,color: locator<AppThemeColors>().darkGray):Image.asset(item.disabledIcon!,color: locator<AppThemeColors>().darkGray,width: 30.w),
                  ),
                ),
                Text(
               item.title,
                  style: TextStyle(color: locator<AppThemeColors>().darkGray,fontSize: 15.sp,overflow:TextOverflow.fade,fontWeight: FontWeight.bold ),
                )
              ],
            ),
            activeIcon: Column(
              children: [
                Container(
                  // color: Colors.red,
                  padding: EdgeInsetsDirectional.only(top: 6.h),
                 // width: 180.w,
                  height: 30.h,
                  // decoration: BoxDecoration(
                  //   image:DecorationImage(
                  //     image: AssetImage(item.enabledIcon)
                  //   )
                  //
                  // ),
                  child:item.disabledIcon==null? Icon(Icons.notifications,color: locator<AppThemeColors>().primaryColor): Image.asset(item.enabledIcon,color: locator<AppThemeColors>().primaryColor,width: 30.w,),
                ),
                Text(
                  item.title,
                  style: TextStyle(color: locator<AppThemeColors>().primaryColor,fontSize: 20.sp,fontWeight: FontWeight.bold),
                )
              ],
            ),
            label: item.title,

          ))
          .toList();

  Widget get currentPage => currentNavigationItem.page;

  void navigateToPage(int index) {
    _currentIndex = index;
  }
}

class NavigationItem {
  final String title;
  final String enabledIcon;
  final String? disabledIcon;
  final Widget page;

  NavigationItem({required this.title,
    required this.enabledIcon,
     this.disabledIcon,
    required this.page});
}
//
// class RootPageWidget extends StatefulWidget {
//   @override
//   _RootPageWidgetState createState() => _RootPageWidgetState();
// }
//
// class _RootPageWidgetState extends State<RootPageWidget> {
//   final NavigationController navigationController = NavigationController();
//
//   final bloc = locator<RootCubit>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RootCubit, RootState>(
//       bloc: bloc,
//       builder: (context, state) {
//         return Scaffold(
//           body: navigationController.navigationItems[state.currentIndex].page,
//           bottomNavigationBar: Theme(
//             data: Theme.of(context).copyWith(
//               canvasColor: locator<AppThemeColors>().primaryColor,
//             ),
//             child: BottomNavigationBar(
//               items: navigationController.bottomNavigationBarItems,
//               iconSize: 24,
//               currentIndex: state.currentIndex,
//               onTap: (index) {
//                 bloc.navigate(index);
//                 // navigationController.navigateToPage(index);
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class RootPageWidget extends StatefulWidget {
  RootPageWidget({required this.navigationShell, required this.index});

  final Widget navigationShell;
  int index;

  @override
  // ignore: library_private_types_in_public_api
  _RootPageWidgetState createState() => _RootPageWidgetState();
}

class _RootPageWidgetState extends State<RootPageWidget> {
  //final bloc = locator<AppBloc>();
  final NavigationController navigationController = NavigationController();

  final bloc = locator<RootCubit>();
  final appBloc = locator<AppBloc>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // bloc.navigate(0);
  }

  @override
  Widget build(BuildContext context) {
    print("index${widget.index}${bloc.state.currentIndex}${navigationController.bottomNavigationBarItems[bloc.state.currentIndex].label}");
    return BlocConsumer<RootCubit, RootState>(
      bloc: bloc,
      listener: (context, state) {


      },
      builder: (context, state) {

        return Scaffold(
          appBar: CustomAppBar(
              title: navigationController.bottomNavigationBarItems[bloc.state.currentIndex].label??'',
              actions: [
                Image.asset(ImagesKeys.splashLogo,width: 40.sp,),
              ],
            ),
          body: widget.navigationShell,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: locator<AppThemeColors>().white,
            ),
            child: BottomNavigationBar(
              elevation: 3,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              //  type: BottomNavigationBarType.shifting,
              items: navigationController.bottomNavigationBarItems,
              //  iconSize: 24,
              currentIndex: bloc.state.currentIndex,
              onTap: (index) {
                bloc.navigate(index);
                //  navigationController.navigateToPage(index);
                print("index 3 navigate button${index}");
                if (index == 0) {
                  context.go(RoutesPath.profilePage,extra: {'index': 0});
                } else if (index == 1) {
                //  context.go(RoutesPath.sevices, extra: {'index': 1});
                  context.go(RoutesPath.rootPage, extra: {'index': 1});
                } else if (index == 2) {
                //  context.go(RoutesPath.emergencyPage, extra: {'index': 2});
                } else if (index == 3) {
                  context.go(RoutesPath.emergencyPage, extra: {'index': 3});
                } else if (index == 4) {

                }
              },
            ),
          ),
        );
      },
    );


  }

}



