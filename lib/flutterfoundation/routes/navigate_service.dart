import 'package:flutter/material.dart';

/*
*
* // MaterialApp.navigatorKey:Application.getIt<NavigateService>().key  设置
///Application.getIt<NavigateService>().pushNamed("App", arguments: "hi");可以通过这样直接跳转
*
* */
class NavigateService {
  final GlobalKey<NavigatorState> key = GlobalKey(debugLabel: 'navigate_key');

  NavigatorState get navigator => key.currentState;

  get pushNamed => navigator.pushNamed;
  get push => navigator.push;
  get popAndPushNamed => navigator.popAndPushNamed;
}
