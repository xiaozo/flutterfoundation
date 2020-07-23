import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoundation_example/pages/App.dart';
import 'package:flutterfoundation_example/pages/Login.dart';

var loginHandle = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return Login();
    });

var appHandle = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return App();
    });