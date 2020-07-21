import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class WidgetAdapter {
  Object eventName = Uuid();

  dynamic widgetEl;
  Object arguments;
  WidgetAdapter({
    Key key,
    @required
    this.widgetEl,
    this.arguments,

  });
}