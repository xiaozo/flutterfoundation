import 'package:flutter/material.dart';
import 'package:flutterfoundation_example/route/LoginRoutes.dart';
import 'package:flutterfoundation_example/untils/NavigatorUtil.dart';

class Login extends StatelessWidget
{

  Login({
    Key key,
    @required this.text,  // 接收一个text参数
  }) : super(key: key);
  final String text;

  void __test() {
//    Application.getIt<NavigateService>().pushNamed("App", arguments: "hi");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title:Text("login"),
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
                NavigatorUtil.goAppPage(context);

              },
            ),
            FlatButton(
              child: Text("test btn"),
              textColor: Colors.blue,
              onPressed: () {
                __test();

              },
            ),
          ],
        ),
      ),
    );
  }
}