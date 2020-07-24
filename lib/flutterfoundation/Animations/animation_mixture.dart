
import 'dart:ffi';

import 'package:flutter/material.dart';

class AnimationMixture<T> {

  Animation<T> animation;
  AnimationController controller;


  void setupFadeTransition (Duration duration,Tween<T> tween,TickerProvider vsync) {
    controller = AnimationController(
      vsync: vsync,
      duration: duration,
    );
    animation = tween.animate(controller) as Animation<T>;
  }
}