import 'package:flutter/material.dart';

import '../WindowApp.dart';
import 'EventBus.dart';

class ZYGlobal {
  static WindowApp windowApp;
  static EventBus eventBus;

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    eventBus = new EventBus();
  }
}