import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/widget_mixture.dart';


class BaseStatelessWidget extends StatefulWidget with WidgetRmoveMixture,WidgetMixture{
  @override
  _BaseStatelessWidgetState createState() => _BaseStatelessWidgetState();
}

class _BaseStatelessWidgetState extends State<BaseStatelessWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}