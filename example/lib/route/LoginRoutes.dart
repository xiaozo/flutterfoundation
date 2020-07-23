import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/routes/Routes.dart';

import 'LoginRouteHandles.dart';

class LoginRoutes extends Routes {
  static String login = "/";
  static String app = "/app";
  static void configureRoutes(Router router) {
    Routes.configureRoutes(router);
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
          return null;
        });

    router.define(login, handler: loginHandle);
    router.define(app, handler: appHandle);

  }
}