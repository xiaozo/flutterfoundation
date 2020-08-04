
import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/widget_mixture.dart';

class BaseStatefulWidget extends StatefulWidget with WidgetRmoveMixture {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

abstract class BaseState <T extends BaseStatefulWidget> extends State <T> with WidgetMixture{

  @override
  void dispose() {
    debugPrint("dispose");
    super.dispose();
  }

  void removeFromSuperview() {
    widget.removeFromSuperview();
  }

  @override
  void update() {
    super.update();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}