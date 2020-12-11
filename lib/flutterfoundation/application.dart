import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/foundation_config_until.dart';
import 'package:flutterfoundation/flutterfoundation/routes/navigate_service.dart';
import 'package:flutterfoundation/flutterfoundation/untils/native_image_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'window_app.dart';
import 'Common/event_bus.dart';

typedef ApplicationInitHandle();

class Application {
  static GlobalKey<NavigatorState> key = GlobalKey();
  static BuildContext context;
  static FluroRouter router;
  static WindowApp windowApp;
  static EventBus eventBus;
  static double scale;
  static GetIt getIt = GetIt.instance;
  static SharedPreferences sp;

  //初始化全局信息，会在APP启动时执行
  static Future init(
      {
        ///参数配置文件  如控件的一些颜色 间距
        FoundationConfig foundationConfig,
      }) async {
//    sp = await SharedPreferences.getInstance();
    eventBus = new EventBus();
    getIt.registerSingleton(NavigateService());
    if (foundationConfig == null) foundationConfig = FoundationConfig();

    getIt.registerSingleton(foundationConfig);
  }

  static initSp() async {
    sp = await SharedPreferences.getInstance();
  }
}
