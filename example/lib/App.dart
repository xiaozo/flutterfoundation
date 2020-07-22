import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/BaseState.dart';
import 'package:flutterfoundation/flutterfoundation/Common/ZYGlobal.dart';
import 'package:flutterfoundation/flutterfoundation/WidgetAdapter.dart';
import 'package:flutterfoundation_example/LoginSuccess.dart';

import 'Login.dart';
import 'LoginConstrainedBox.dart';
import 'LoginSuccess1.dart';
import 'SuccessConstrainedBox.dart';
import 'TestView.dart';



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
//        removeWidgetAdapter(widgetAdapter);
//        ZYGlobal.windowApp.addWidget(TestView());
//      Navigator.pop(context);
//        Navigator.popUntil(context, ModalRoute.withName('Login'));

        LoginSuccess newroute = LoginSuccess();
        ZYGlobal.windowApp.setRootWidget(
            SuccessConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Stack(
                alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
                children:[ MaterialApp(
                  routes:{
                    "LoginSuccess":(context) => LoginSuccess(),
                    "LoginSuccess1":(context) => LoginSuccess1(),
                  },
                  home:newroute ,
                )],
              ),
            ));
      },
    );

    addSubView(WidgetAdapter(
        widgetEl:widget
    ));

    Widget widget2 =  FlatButton(
      color: Colors.red,
      child: Text("push"),
      textColor: Colors.blue,
      onPressed: () {
        Navigator.of(context).pushNamed("App", arguments: "hi");
      },
    );

    addSubView(WidgetAdapter(
        widgetEl:widget2
    ));

//    widget =  Positioned(child: TestView(),left: 30.0,top: 30.0,);
    widget =  SizedBox(
      width: 400,
      height: 80.0,
      child: TestView(),
    );
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
      body: widgetBody
    );
  }
}