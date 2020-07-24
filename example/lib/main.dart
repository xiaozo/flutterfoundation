import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutterfoundation/flutterfoundation/application.dart';
import 'package:flutterfoundation/flutterfoundation/window_app.dart';
import 'package:flutterfoundation_example/route/AppRouteHelp.dart';
import 'package:flutterfoundation_example/untils/navigator_util.dart';


void main() {
  Application.init((){
    Application.getIt.registerSingleton(SuccessNavigateService());
  }).then((e) {
    Widget rootWidget = NavigatorUtil.rootLoginWidget();
    Widget windowApp = WindowApp(windowAppCallback: () {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: WindowAppPage(
            rootWidget: rootWidget),
      );
    });
    Application.windowApp = windowApp;
    runApp(Application.windowApp);
  });
}
