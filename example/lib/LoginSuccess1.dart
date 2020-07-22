import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/BaseState.dart';
import 'package:flutterfoundation/flutterfoundation/Common/ZYGlobal.dart';
import 'package:flutterfoundation/flutterfoundation/WidgetAdapter.dart';

import 'App.dart';
import 'Login.dart';
import 'LoginConstrainedBox.dart';
import 'TestView.dart';



class LoginSuccess1 extends BaseStatefulWidget
{

  LoginSuccess1({
    Key key,
  });

  @override
  _LoginSuccess1 createState() => _LoginSuccess1();

}

class _LoginSuccess1 extends BaseState<LoginSuccess1>  {

  WidgetAdapter widgetAdapter;


  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    super.didChangeDependencies();


    Widget widget2 =  FlatButton(
      color: Colors.red,
      child: Text("LOGIN"),
      textColor: Colors.blue,
      onPressed: () {
        Login newroute = Login();
        ZYGlobal.windowApp.setRootWidget( LoginConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
            children:[ MaterialApp(
              routes:{
                "Login":(context) => Login(),
                "App":(context) => App(),
              },
              home:newroute ,
            )],
          ),
        ));
      },
    );

    addSubView(WidgetAdapter(
        widgetEl:widget2
    ));



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
          title:Text("loginsuccess1"),
        ),
        body: widgetBody
    );
  }
}