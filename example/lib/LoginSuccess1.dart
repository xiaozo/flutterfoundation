import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/BaseState.dart';
import 'package:flutterfoundation/flutterfoundation/Application.dart';
import 'package:flutterfoundation/flutterfoundation/WidgetAdapter.dart';

import 'App.dart';
import 'Login.dart';
import 'LoginConstrainedBox.dart';

class LoginSuccess1 extends BaseStatefulWidget
{

  LoginSuccess1({
    Key key,
  });

  @override
  _LoginSuccess1 createState() => _LoginSuccess1();

}

class _LoginSuccess1 extends BaseState<LoginSuccess1> with SingleTickerProviderStateMixin {

  WidgetAdapter widgetAdapter;
  String str = "ABCDEFABCDEFABCDEFABCDEFABCDEFABCDEFABCDEFABCDEFABCDEFABCDEFABCDEFABCDEF";

  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    super.didChangeDependencies();


//
    Widget widget2 =  FlatButton(
      color: Colors.red,
      child: Text("LOGIN"),
      textColor: Colors.blue,
      onPressed: () {
        App newroute = App();
        Application.windowApp.setRootWidget( LoginConstrainedBox(
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
        widgetEl:list
    ));

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

  Widget scrollview () {
   return Scrollbar( // 显示进度条
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            //动态创建一个List<Widget>
            children: str.split("")
            //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => Text(c, textScaleFactor: 2.0,))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget list(){
    //下划线widget预定义以供复用。
    Widget divider1=Divider(color: Colors.blue,);
    Widget divider2=Divider(color: Colors.green);
    return ListView.separated(
      itemCount: 100,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index%2==0?divider1:divider2;
      },
    );
  }

  @override
//  Widget build(BuildContext context) {
//    print("_LoginSuccess1 build");
//    //获取路由参数
////    var args=ModalRoute.of(context).settings.arguments;
////  print(args);
//    Widget widgetBody  = bodyWidgetBychildbodyWidgetBlock((List<Widget> widgets){
////      return Column(
////        crossAxisAlignment: CrossAxisAlignment.start,
////          children:widgets
////      );
//      return Container(
//        color: Colors.red,
//        child:Column(
//            mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.end,
//            children:widgets
//        ) ,);
//    });
//    return Scaffold(
//
//        appBar: AppBar(
//          title:Text("loginsuccess1"),
//        ),
//        body: widgetBody
//    );
//  }

  Widget build(BuildContext context){
    print("build  loginsuccess1");
    return Scaffold(

        appBar: AppBar(
          title:Text("loginsuccess1"),
        ),
        body: bodyWidget()
    );
  }
}