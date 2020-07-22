
import 'package:flutter/material.dart';
class LoginConstrainedBox extends ConstrainedBox {


  LoginConstrainedBox({
    Key key,
    BoxConstraints constraints,
    Widget child,
  }) : super(key: key,child: child,constraints:constraints);
}