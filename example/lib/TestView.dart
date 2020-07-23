
import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/BaseState.dart';
import 'package:flutterfoundation/flutterfoundation/Application.dart';
import 'package:flutterfoundation/flutterfoundation/Animations/AnimationMixture.dart';
import 'package:flutterfoundation/flutterfoundation/Common/EventBus.dart';


class TestView extends BaseStatefulWidget {
  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> with SingleTickerProviderStateMixin,AnimationMixture<double>{


  initState() {
    super.initState();

    setupFadeTransition(Duration(milliseconds: 200), Tween(
      begin: 0.0,
      end: 1.0,
    ),this);

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
        print("status is completed");
        //反向执行
      } else if (status == AnimationStatus.dismissed) {
        //动画从 controller.reverse() 反向执行 结束时会回调此方法
        print("status is dismissed");
        //controller.forward();
      } else if (status == AnimationStatus.forward) {
        print("status is forward");
        //执行 controller.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        //执行 controller.reverse() 会回调此状态
        print("status is reverse");
      }
    });


  }
void dispose() {
  controller.dispose();
    super.dispose();

}
  @override
  Widget build(BuildContext context) {
    print("TestView build");
//    return new Center(
//      child: Image(
//        image: NetworkImage(
//            "https://pcdn.flutterchina.club/imgs/3-17.png"),
//          width: animation.value,
//          height: animation.value
//      ),
//    );

    controller.forward();
    return FadeTransition(
      child: Container(
        color: Colors.blue,
        width: 200.0,
        height: 200.0,
      ),
      opacity: animation,
    );

  return Container(
    color: Colors.red,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("xxx"),
          Text('zzz'),
          FlatButton(
            color: Colors.red,
            child: Text("RM"),
            textColor: Colors.blue,
            onPressed: () {
              removeFromSuperview();
            },
          ),
          FlatButton(
            color: Colors.red,
            child: Text("ADD"),
            textColor: Colors.blue,
            onPressed: () {
              Application.windowApp.addWidget(
                  FadeTransition(opacity: controller,child:SizedBox(width: 100,height: 100,child: FlatButton( child: Text("Avvv"),color: Colors.red,)))
              );
              controller.forward();
//            setState(() {
//
//            });

            },
          )
        ],
      ),
  );
  }
}