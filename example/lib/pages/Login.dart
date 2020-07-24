import 'package:flutter/material.dart';
import 'package:flutterfoundation_example/route/LoginRoutes.dart';
import 'package:flutterfoundation_example/untils/navigator_util.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/system/appbar_gradient.dart';

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

      appBar: GradientAppBar(
//        leading:Text("login") ,
      leadings: <Widget>[
        IconButton(icon: Icon(Icons.menu),onPressed: (){},),
        Text("item"),
        IconButton(icon: Icon(Icons.menu),onPressed: (){},),
      ],
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu),onPressed: (){},),
          Text("item"),
        ],
          title:Text("lglogilgloginlolgloginlolgloginlolgloginlolgloginlolgloginlolgloginlonlo"),
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: kToolbarHeight,
              child: Container(
              color: Colors.blue,
              child: Flex(
                direction: Axis.horizontal,
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //left
                  Text("leleftleftleftft"),
                  Text("centecentercentercentercenterr"),
                  Text(""),

                ],
              ) ,),),


          ],
        ),
      ),
    );
  }
}