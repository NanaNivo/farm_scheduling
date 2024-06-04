import 'dart:async';

import 'package:farm_scheduling/presentation/flows/auth_flow/code_page.dart';
import 'package:farm_scheduling/presentation/flows/auth_flow/profile_screen.dart';
import 'package:farm_scheduling/presentation/flows/emergincy_flow/screens/add_emergency.dart';
import 'package:farm_scheduling/presentation/flows/emergincy_flow/screens/emergincy_page.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/screens/add_field.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/screens/farm_detiel.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/screens/farm_home.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/screens/farm_list.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/screens/field_detiel.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/screens/field_list.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/screens/field_task.dart';
import 'package:farm_scheduling/presentation/flows/farm_flow/screens/tool_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:farm_scheduling/presentation/flows/auth_flow/login_page.dart';
import 'package:farm_scheduling/presentation/flows/auth_flow/register_page.dart';

import 'package:farm_scheduling/presentation/flows/root_flow/screens/root_page.dart';
import 'package:farm_scheduling/presentation/flows/startup_flow/screens/splash_screen.dart';

import '../../app+injection/app.dart';

import '../../app+injection/di.dart';

import '../blocs/application_bloc/app_bloc.dart';
import '../mediators/communication_types/AppStatus.dart';
import '../resources/colors.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final sectionNavigatorKey = GlobalKey<NavigatorState>();

class RoutesPath {
  static String get splashScreen => '/';

  static String get welcomePage => '/welcome';

  static String get loginPage => '/auth';

  static String get forgetPasswordPage => '$loginPage/forget-password';

  static String get register => '$loginPage/register';
  static String get codeScreen => '$loginPage/codeScreen';

  static String get verifyCodePage => '$forgetPasswordPage/verify-code';

  static String get resetPasswordPage => '$verifyCodePage/reset-password';

  static String get changePasswordSuccessPage =>
      '$resetPasswordPage/change-success';

  static String get rootPage => '/root';
  static String get farmListPage => '$rootPage/farm-list';

  static String get farmDetieltPage => '$farmListPage/farm-detiel';


  static String get fieldList =>'$farmDetieltPage/field-list';
  static String get toolList => '$farmDetieltPage/tool-list';
  static String get addField => '$fieldList/add-field';
  static String get fieldTask => '$fieldList/field-task';
  static String get fieldDetiel => '$fieldList/field-detiel';

  static String get emergencyPage => '/Emergency';
  static String get emergencyAdd =>'$emergencyPage/emergency-add';

  static String get userPage => '/user';



  static String get home2 => '$rootPage/home2';

  static String get category => '/category';
  static String get products => '$category/products';
  static String get productDetails => '$products/product-details';


  static String get categoryDetailPage => '/category/detail';

  static String get bag => '/bag';

  static String get preCheckoutForm => '$bag/pre-checkout-form';

  static String get deliveryMethod => '$preCheckoutForm/delivery-method';

  static String get deliveryStores => '$deliveryMethod/delivery-stores';

  static String get confirmDetails => '$deliveryStores/confirm-details';

 // static String get products => '/products';

  static String get wishList => '/wishlist';

  static String get profilePage => '/profile';

  static String get currencies => '$profilePage/currencies';

  static String get privacyPolicy => '$profilePage/privacyPolicy';

  static String get stores => '$profilePage/stores';

  static String get mapStores => '$stores/mapScreen';

  static String get filters => '$products/filters';

  static String get contactUs => '$profilePage/contactUs';

  static String get editProfile => '/profile/editProfile';

  static String get registerStep2 => '$loginPage/register/register2';

  // static String get resetPasswordConfirm =>'reset-confirm';
  static String get changePasswordConfirm =>
      '$forgetPasswordPage/reset-confirm';

  static String get orders => '$profilePage/orders';

  static String get detailedOrder => '$orders/detailedOrder';
}

final router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: rootNavigatorKey,
  routes: routes,
  initialLocation: RoutesPath.splashScreen,
  refreshListenable: GoRouterRefreshStream(locator<AppBloc>().stream),
);

final List<RouteBase> routes = [
  GoRoute(
    parentNavigatorKey: rootNavigatorKey,
    name: "splash",
    path: "/",
    builder: (context, state) {
      print('ddddddddddd');
      return const SplashScreen();
    },
    redirect: (context, goState) {

      if (locator<AppBloc>().state.appStatus == Status.unauthorized ) {
        print(
            'splash splash splash splash ${locator<AppBloc>().state.isFirstTime} ${goState.location == RoutesPath.splashScreen} ${locator<AppBloc>().state.appStatus} ${goState.matchedLocation}');

        return RoutesPath.loginPage;
      }
      else if(locator<AppBloc>().state.appStatus == Status.authorized)
      {
      return RoutesPath.rootPage;
      }
      return null;
    },
  ),
  GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      name: 'loginScreen',
      path: '/auth',
      builder: (context, state) => LogInPage(),
      redirect: (context, goRouterState) {
        print('authauthauth');
        if (locator<AppBloc>().state.appStatus == Status.authorized &&
            goRouterState.path == RoutesPath.loginPage) {
          //return RoutesPath.rootPage;
        }
        return null;
      },
      routes: [
        GoRoute(
            parentNavigatorKey: rootNavigatorKey,
            name: 'RegisterScreen',
            path: 'register',
            builder: (context, state) => RegisterPage(),
            routes: [

            ]),

        GoRoute(
            parentNavigatorKey: rootNavigatorKey,
            name: 'CodeScreen',
            path: 'codeScreen',
            builder: (context, state) => CodePage(),
            routes: [

            ]),
      ]),
  ShellRoute(
    builder: (context, state, child) {
      Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;
      return RootPageWidget(
        navigationShell: child,
        index: extra == null ? 1 : extra['index'] ?? 1,
      );
    },
    routes: [

      GoRoute(
          path: '/root',
          builder: (context, state) {
            return FarmListWidget();
          },
          routes: [
            GoRoute(
              path: 'farm-list',
              builder: (context, state) {
                Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;
                // return ProductDetieles(slug: extra!['slug'],);
                return FarmListWidget();



              },
              routes: [
                GoRoute(
                  path: 'farm-detiel',
                  builder: (context, state) {
                    Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;
                    // return ProductDetieles(slug: extra!['slug'],);
                    return FarmDetielWidget(farmModel:  extra!['farmModel'],);

                  },
                  routes: [
                    GoRoute(
                        path: 'tool-list',
                        builder: (context, state) {
                          Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;
                          // return ProductDetieles(slug: extra!['slug'],);
                          return ToolListWidget(farmId:extra!['farm'] ,);



                        },
                        routes: [

                        ]
                    ),
                    GoRoute(
                        path: 'field-list',
                        builder: (context, state) {
                          Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;
                          // return ProductDetieles(slug: extra!['slug'],);
                          return FieldListWidget(farmId:extra!['farm'] ,);
                        },
                        routes: [
                          GoRoute(
                              path: 'add-field',
                              builder: (context, state) {
                                Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;
                                // return ProductDetieles(slug: extra!['slug'],);
                                return AddFieldWidget(farmId: extra!['farmId'],);
                              },
                              routes: []
                          ),
                          GoRoute(
                              path: 'field-detiel',
                              builder: (context, state) {
                                Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;
                                // return ProductDetieles(slug: extra!['slug'],);
                                return FieldDetiel(fieldModel: extra!['fieldModel'], );

                              },
                              routes: [

                              ]
                          ),
                          GoRoute(
                              path: 'field-task',
                              builder: (context, state) {
                                Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;
                                // return ProductDetieles(slug: extra!['slug'],);
                                return FieldTaskWidget(fieldId: extra!['field'] ,);

                              },
                              routes: [

                              ]
                          ),
                        ]
                    ),

                  ]
                ),


              ]
            ),
          ],
          redirect: (context, goRouterState) {
            print('dddddddddddHome${goRouterState}');
            if (locator<AppBloc>().state.appStatus == Status.unauthorized) {
              //  return RoutesPath.loginPage;
            }
            return null;
          }),
      GoRoute(
          path: '/category',
          builder: (context, state) {
          //  return CategoryPage();
            return Container();
          },
          routes: [
            GoRoute(path: 'products',
              builder: (context,state){
                Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;
              //  return ProductPage(categoryId: extra!['id'],);
                return Container();

              },
                routes: [
                  GoRoute(
                    path: 'product-details',
                    builder: (context, state) {
                      Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;
                     // return ProductDetieles(slug: extra!['slug'],);
                      return Container();

                    },
                  )
                ],
              ),

          ],
          redirect: (context, goRouterState) {
            print('dddddddddddHome${goRouterState}');
            if (locator<AppBloc>().state.appStatus == Status.unauthorized) {
              //  return RoutesPath.loginPage;
            }
            return null;
          }),
      GoRoute(
          path: '/Emergency',
          builder: (context, state) {
            Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;
         //   return CartPage();
            return EmergincyListWidget(farmId: extra?['farmId'],fieldId:extra?['fieldId']);
          },
          routes: [
            GoRoute(
              path: 'emergency-add',
              builder: (context, state) {
                Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;
                // return ProductDetieles(slug: extra!['slug'],);
                return AddEmergencyWidget(farmId: extra?['farmId']??0,fieldId:extra?['fieldId']??0);

              },
            )
          ],
          redirect: (context, goRouterState) {
            print('dddddddddddHome${goRouterState}');
            if (locator<AppBloc>().state.appStatus == Status.unauthorized) {
              //  return RoutesPath.loginPage;
            }
            return null;
          }),
      GoRoute(
          path: '/user',
          builder: (context, state) {
            return LogInPage();
          },
          routes: [],
          redirect: (context, goRouterState) {
            print('dddddddddddHome${goRouterState}');
            if (locator<AppBloc>().state.appStatus == Status.unauthorized) {
              //  return RoutesPath.loginPage;
            }
            return null;
          }),
      GoRoute(
          path: '/profile',
          builder: (context, state) {
          //  return ProfileScreen();
            return ProfileScreen();
          })
    ],
  ),
];

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<Status> _subscription;

  GoRouterRefreshStream(Stream<AppState> stream) {
    notifyListeners();
    _subscription = stream
        .asBroadcastStream()
        .map((AppState event) => event.appStatus)
        .listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
