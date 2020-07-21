import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/Common/ZYGlobal.dart';

class Login extends StatelessWidget
{

  Login({
    Key key,
    @required this.text,  // 接收一个text参数
  }) : super(key: key);
  final String text;

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
//                App newroute = App();
//                ZYGlobal.windowApp.setRootWidget(newroute);
                //导航到新路由
                Navigator.of(context).pushNamed("App", arguments: "hi");

              },
            ),
          ],
        ),
      ),
    );
  }
}