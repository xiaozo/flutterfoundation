import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation.dart';
import 'dart:async';

import 'package:flutterfoundation/flutterfoundation/application.dart';
import 'package:flutterfoundation/flutterfoundation/window_app.dart';
import 'package:flutterfoundation_example/route/AppRouteHelp.dart';
import 'package:flutterfoundation_example/untils/navigator_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'nets/net_utils.dart';

void main() {
  Application.init().then((e) {
    NetUtils.init("http://dev-ip.thedeer.cn:91/zykj-api/userapp/");
    Application.getIt.registerSingleton(SuccessNavigateService());
    Widget windowApp = WindowApp(windowAppRootCallback: (BuildContext context) {
      ScreenUtil.init(context, width: 414, height: 736);
      Widget rootWidget = NavigatorUtil.rootLoginWidget(context);
     return rootWidget;

    });
    Application.windowApp = windowApp;
    runApp(Application.windowApp);
  });
}
