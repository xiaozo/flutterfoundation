import 'package:flutterfoundation/flutterfoundation/routes/navigate_service.dart';
import 'package:flutter/material.dart';

class SuccessNavigateService extends NavigateService{

}

class LoginStack extends Stack {
  LoginStack({
    Key key,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection textDirection,
    StackFit fit = StackFit.loose,
    Overflow overflow = Overflow.clip,
    List<Widget> children = const <Widget>[],
  }) : super(key: key,alignment: alignment,textDirection:textDirection,fit:fit,overflow:overflow,children:children);
}

class SuccessStack extends Stack {
  SuccessStack({
    Key key,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection textDirection,
    StackFit fit = StackFit.loose,
    Overflow overflow = Overflow.clip,
    List<Widget> children = const <Widget>[],
  }) : super(key: key,alignment: alignment,textDirection:textDirection,fit:fit,overflow:overflow,children:children);
}