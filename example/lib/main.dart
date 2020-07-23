import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutterfoundation/flutterfoundation/routes/NavigateService.dart';
import 'package:flutterfoundation/flutterfoundation/Application.dart';
import 'package:flutterfoundation/flutterfoundation/WindowApp.dart';
import 'package:flutterfoundation_example/pages/App.dart';
import 'package:flutterfoundation_example/pages/Login.dart';
import 'package:flutterfoundation_example/route/AppRouteHelp.dart';
import 'package:flutterfoundation_example/untils/NavigatorUtil.dart';


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
