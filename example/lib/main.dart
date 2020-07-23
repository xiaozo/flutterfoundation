import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutterfoundation/flutterfoundation/Application.dart';
import 'package:flutterfoundation/flutterfoundation/WindowApp.dart';

import 'App.dart';
import 'Login.dart';
import 'LoginConstrainedBox.dart';

void main() {
  Application.init().then((e) {
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
                rootWidget:LoginConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Stack(
                    alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
                    children:[ MaterialApp(
                      routes:{
                        "Login":(context) => Login(),
                        "App":(context) => App(),
                      },
                      home:newroute ,
                    )],
                  ),
                )
            ),
          );
        });
    Application.windowApp = windowApp;
    runApp(Application.windowApp);

  });

}