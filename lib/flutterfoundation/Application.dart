import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/routes/NavigateService.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'WindowApp.dart';
import 'Common/EventBus.dart';

typedef ApplicationInitHandle ();

class Application {
  static GlobalKey<NavigatorState> key = GlobalKey();
  static Router router;
  static WindowApp windowApp;
  static EventBus eventBus;
  static GetIt getIt = GetIt.instance;
  static SharedPreferences sp;

  //初始化全局信息，会在APP启动时执行
  static Future init(ApplicationInitHandle applicationInitHandle) async {
//    sp = await SharedPreferences.getInstance();
    eventBus = new EventBus();
    getIt.registerSingleton(NavigateService());
    if (applicationInitHandle != null) applicationInitHandle();
  }

  static initSp() async{
    sp = await SharedPreferences.getInstance();
  }

}