import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutterfoundation/flutterfoundation/application.dart';
import 'package:flutterfoundation/flutterfoundation/window_app.dart';
import 'package:flutterfoundation_example/route/AppRouteHelp.dart';
import 'package:flutterfoundation_example/untils/navigator_util.dart';
import 'package:flutterfoundation/flutterfoundation/foundation_config_until.dart';

void main() {
  Application.init().then((e) {

    Application.getIt.registerSingleton(SuccessNavigateService());

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
