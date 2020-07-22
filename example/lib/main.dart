import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutterfoundation/flutterfoundation/Common/ZYGlobal.dart';
import 'package:flutterfoundation/flutterfoundation/WindowApp.dart';

import 'App.dart';
import 'Login.dart';

void main() {
  ZYGlobal.init().then((e) {
    Login newroute = Login();
    Widget windowApp = WindowApp(
        windowAppCallback:(){
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.red,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
//            routes:{
//              "Login":(context) => Login(),
//              "App":(context) => App(),
//            },
            home: WindowAppPage(
                rootWidget:MaterialApp(
                    routes:{
                      "Login":(context) => Login(),
                      "App":(context) => App(),
                    },
                  home:newroute ,
                )
            ),
          );
        });
    ZYGlobal.windowApp = windowApp;
    runApp(ZYGlobal.windowApp);

  });

}