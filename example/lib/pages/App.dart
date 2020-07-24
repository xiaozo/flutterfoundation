import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/base_state.dart';
import 'package:flutterfoundation/flutterfoundation/application.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/widget_adapter.dart';
import 'package:flutterfoundation_example/untils/navigator_util.dart';
import 'package:flutterfoundation_example/widgets/TestView.dart';

import 'Login.dart';

import 'LoginSuccess.dart';
import 'LoginSuccess1.dart';



class App extends BaseStatefulWidget
{

  App({
    Key key,
    @required this.text,  // 接收一个text参数
  });
  final String text;

  @override
  _App createState() => _App();

}

class _App extends BaseState<App>  {

  static var i = 0;
  WidgetAdapter widgetAdapter;


  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    super.didChangeDependencies();

    Widget widget =  FlatButton(
      color: Colors.red,
      child: Text("window.rootViewController"),
      textColor: Colors.blue,
      onPressed: () {
        Application.windowApp.setRootWidget(NavigatorUtil.rootLoginSuccessWidget());
      },
    );

    addSubView(WidgetAdapter(
        widgetEl:widget
    ));

//    widget =  Positioned(child: TestView(),left: 30.0,top: 30.0,);

    widget =  SizedBox(
      width: 400,
      height: 80.0,
      child: TestView(),
    );

    widget = TestView();

    widgetAdapter = WidgetAdapter(
        widgetEl:widget
    );
    addSubView(widgetAdapter);

//    addSubView(WidgetAdapter(
//        widgetEl:testwidget,
//      arguments: {'top': 200.0}
//    ));

  }

  Widget testwidget(obj) {
    Widget widget =  Image(
      image: NetworkImage(
          "https://pcdn.flutterchina.club/imgs/3-17.png"),
      width: 100.0,
    );
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    print("app build");
    //获取路由参数
//    var args=ModalRoute.of(context).settings.arguments;
//  print(args);
  Widget widgetBody  = bodyWidgetBychildbodyWidgetBlock((List<Widget> widgets){
//      return Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//          children:widgets
//      );
   return Container(
     color: Colors.red,
     child:Column(
         mainAxisSize: MainAxisSize.min,
       crossAxisAlignment: CrossAxisAlignment.end,
       children:widgets
   ) ,);
    });
    return Scaffold(

      appBar: AppBar(
        title:Text("app"),
      ),
      body: bodyWidget()
    );
  }
}