import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/routes/Routes.dart';

import 'SuccessRouteHandles.dart';

class SuccessRoutes extends Routes {

  static String loginSuccess = "/";
  static String loginSuccess1 = "/loginSuccess1";

  static void configureRoutes(Router router) {
    Routes.configureRoutes(router);
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
          return null;
        });

    router.define(loginSuccess, handler: loginSuccessHandle);
    router.define(loginSuccess1, handler: loginSuccessHandle1);
  }
}