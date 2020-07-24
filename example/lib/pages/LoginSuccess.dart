import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/Application.dart';
import 'package:flutterfoundation_example/route/AppRouteHelp.dart';
import 'package:flutterfoundation_example/route/SuccessRoutes.dart';
import 'package:flutterfoundation_example/untils/navigator_util.dart';
class LoginSuccess extends StatelessWidget
{

  LoginSuccess({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Text("LOGINSUCCESS"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Image(
              image: NetworkImage(
                  "https://pcdn.flutterchina.club/imgs/3-17.png"),
              width: 100.0,
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
//                App newroute = App();
//                ZYGlobal.windowApp.setRootWidget(newroute);
                NavigatorUtil.goSuccess1Page(context);
              },
            ),
            FlatButton(
              child: Text("test btn"),
              textColor: Colors.blue,
              onPressed: () {
                Application.getIt<SuccessNavigateService>().pushNamed(SuccessRoutes.loginSuccess1, arguments: "hi");

              },
            ),
          ],
        ),
      ),
    );
  }
}