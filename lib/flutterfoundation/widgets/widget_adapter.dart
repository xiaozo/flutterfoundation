import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/*
* Widget加入主视图的适配模型
* */
class WidgetAdapter {
  Object eventName = Uuid().v1();

  ///Widget 或者生成Widget的函数
  dynamic widgetEl;
  ///生成Widget的函数的参数
  Object arguments;
  WidgetAdapter({
    Key key,
    @required
    this.widgetEl,
    this.arguments,

  });
}