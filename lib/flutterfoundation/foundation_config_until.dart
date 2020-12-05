
import 'package:flutter/material.dart';

import 'Application.dart';

class FoundationConfigUntil {
  static FoundationConfig goalFoundationConfig = Application.getIt<FoundationConfig>();
  ///
  static  double navItemMargin = goalFoundationConfig.navItemMargin;
  static  double navItemSpacing = goalFoundationConfig.navItemSpacing;
  static  double screenUtilWidth = goalFoundationConfig.screenUtilWidth;
  static  double screenUtilHeight = goalFoundationConfig.screenUtilHeight;
}

/*全局配置*/
class FoundationConfig {
  FoundationConfig({
      this.navItemMargin = 10.0,
    this.navItemSpacing = 5.0,
    this.screenUtilWidth = 0,
    this.screenUtilHeight = 0,
    });

  ///导航栏里的leading 或者 actions距离屏幕边缘的距离
  final double navItemMargin;

  ///导航栏里的leading或者actions里的元素间的间距
  final double navItemSpacing;

  ///ScreenUtil.init 的width
  final double screenUtilWidth;

  ///ScreenUtil.init 的height
  final double screenUtilHeight;

}