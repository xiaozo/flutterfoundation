import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoundation_example/pages/LoginSuccess.dart';
import 'package:flutterfoundation_example/pages/LoginSuccess1.dart';

var loginSuccessHandle = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return LoginSuccess();
    });

var loginSuccessHandle1 = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return LoginSuccess1();
    });