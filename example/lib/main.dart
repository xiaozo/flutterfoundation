import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutterfoundation/flutterfoundation/application.dart';
import 'package:flutterfoundation/flutterfoundation/window_app.dart';
import 'package:flutterfoundation_example/route/AppRouteHelp.dart';
import 'package:flutterfoundation_example/untils/navigator_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  Application.init().then((e) {
    Application.getIt.registerSingleton(SuccessNavigateService());
    Widget windowApp = WindowApp(windowAppRootCallback: (BuildContext context) {

      Widget rootWidget = NavigatorUtil.rootLoginWidget(context);
     return rootWidget;

    });
    Application.windowApp = windowApp;

    runApp(Application.windowApp);
  });
}
