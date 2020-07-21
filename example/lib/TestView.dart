
import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/BaseState.dart';


class TestView extends BaseStatefulWidget {
  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(controller);


  }
void dispose() {
  controller.dispose();
    super.dispose();

}
  @override
  Widget build(BuildContext context) {
//    return new Center(
//      child: Image(
//        image: NetworkImage(
//            "https://pcdn.flutterchina.club/imgs/3-17.png"),
//          width: animation.value,
//          height: animation.value
//      ),
//    );

//    controller.forward();
//    return FadeTransition(
//      child: Container(
//        color: Colors.red,
//        width: 200.0,
//        height: 200.0,
//      ),
//      opacity: animation,
//    );

  return Container(
    color: Colors.red,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text("xxx"), Text('zzz')],
      ),
  );
  }
}