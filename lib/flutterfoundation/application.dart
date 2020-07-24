import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/foundation_config_until.dart';
import 'package:flutterfoundation/flutterfoundation/routes/navigate_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'window_app.dart';
import 'Common/event_bus.dart';

typedef ApplicationInitHandle();

class Application {
  static GlobalKey<NavigatorState> key = GlobalKey();
  static Router router;
  static WindowApp windowApp;
  static EventBus eventBus;
  static GetIt getIt = GetIt.instance;
  static SharedPreferences sp;

  //初始化全局信息，会在APP启动时执行
  static Future init(
      {
        ApplicationInitHandle applicationInitHandle = null,
        FoundationConfig foundationConfig = null,
      }) async {
//    sp = await SharedPreferences.getInstance();
    eventBus = new EventBus();
    getIt.registerSingleton(NavigateService());
    if (foundationConfig == null) foundationConfig = FoundationConfig();
    
    getIt.registerSingleton(foundationConfig);

    if (applicationInitHandle != null) applicationInitHandle();

  }

  static initSp() async {
    sp = await SharedPreferences.getInstance();
  }
}
