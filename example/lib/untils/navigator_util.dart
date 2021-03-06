
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/application.dart';
import 'package:flutterfoundation_example/pages/Login.dart';
import 'package:flutterfoundation_example/pages/LoginSuccess.dart';
import 'package:flutterfoundation_example/route/AppRouteHelp.dart';
import 'package:flutterfoundation/flutterfoundation/routes/navigate_service.dart';
import 'package:flutterfoundation_example/route/LoginRoutes.dart';
import 'package:flutterfoundation_example/route/SuccessRoutes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const String LOGINROUTERID = "LOGINROUTERID";
const String LOGINSUCCESSROUTERID = "LOGINSUCCESSROUTERID";


class NavigatorUtil {

  static Map<String,FluroRouter> _routeMap = Map();
  static _navigateTo(BuildContext context, String path,
      {bool replace = false,
        bool clearStack = false,
        Duration transitionDuration = const Duration(milliseconds: 250),
        RouteTransitionsBuilder transitionBuilder}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: TransitionType.material);
  }


  ///获取login根rootview
  static Widget rootLoginWidget(BuildContext context) {
    FluroRouter router = _routeMap[LOGINROUTERID];
    if (router == null) {
      router = FluroRouter();
      LoginRoutes.configureRoutes(router);
      _routeMap[LOGINROUTERID] = router;

    }
    Login newroute = Login();


    Widget rootWidet =  LoginStack(
      alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
      children: [
        MaterialApp(
//      supportedLocales: S.delegate.supportedLocales,
          navigatorKey: Application.getIt<NavigateService>().key,
          home: newroute,
          onGenerateRoute: router.generator,
        )
      ],
    );

    Application.router = router;

    return rootWidet;

  }

  ///获取登录成功根rootview
  static Widget rootLoginSuccessWidget(BuildContext context) {
    FluroRouter router = _routeMap[LOGINSUCCESSROUTERID];
    if (router == null) {
      router = FluroRouter();
      SuccessRoutes.configureRoutes(router);
      _routeMap[LOGINSUCCESSROUTERID] = router;

    }
    LoginSuccess newroute = LoginSuccess();
    Widget rootWidet =  SuccessStack(
      alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
      children: [
        MaterialApp(
          navigatorKey: Application.getIt<SuccessNavigateService>().key,
          home: newroute,
          onGenerateRoute: router.generator,
        )
      ],
    );

    Application.router = router;

    return rootWidet;
  }

  /// 登录页
  static void goLoginPage(BuildContext context) {
    _navigateTo(context, LoginRoutes.login);
  }

  ///
  static void goAppPage(BuildContext context) {
    _navigateTo(context, LoginRoutes.app);
  }

  static void goRegisterPage(BuildContext context) {
    _navigateTo(context, LoginRoutes.register);
  }

  static void goBottomNavigationPage(BuildContext context) {
    _navigateTo(context, LoginRoutes.bottomNavigation);
  }

  ///
  static void goSuccessPage(BuildContext context) {
    _navigateTo(context, SuccessRoutes.loginSuccess);
  }

  ///
  static void goSuccess1Page(BuildContext context) {
    _navigateTo(context, SuccessRoutes.loginSuccess1);
  }


}