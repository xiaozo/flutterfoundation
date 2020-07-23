import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'WindowApp.dart';
import 'Common/EventBus.dart';

class Application {
  static WindowApp windowApp;
  static EventBus eventBus;
  static GetIt getIt = GetIt.instance;
  static SharedPreferences sp;

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
//    sp = await SharedPreferences.getInstance();
    eventBus = new EventBus();
  }

  static initSp() async{
    sp = await SharedPreferences.getInstance();
  }

  static setupLocator(){

  }
}