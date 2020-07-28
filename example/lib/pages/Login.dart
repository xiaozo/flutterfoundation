
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutterfoundation/flutterfoundation/application.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/base_state.dart';
import 'package:flutterfoundation/generated/l10n.dart';
import 'package:flutterfoundation_example/pages/register.dart';
import 'package:flutterfoundation_example/route/LoginRoutes.dart';
import 'package:flutterfoundation_example/untils/navigator_util.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/system/appbar_gradient.dart';
import 'package:flutterfoundation/flutterfoundation/foundation_config_until.dart';
import 'package:flutter_page_tracker/flutter_page_tracker.dart';

class Login extends BaseStatefulWidget
{
  @override
  _LoginState createState() => _LoginState();

}


class _LoginState extends BaseState<Login>
    with TickerProviderStateMixin{

  void __test(BuildContext context) {

//    Application.getIt<NavigateService>().pushNamed("App", arguments: "hi");
//    Application.windowApp.addWidget(IconButton(icon: Icon(Icons.menu),onPressed: (){}));
    EasyLoading.show(status: 'loading...');
//    EasyLoading.showSuccess('Great Success!');

//    OverlayEntry _overlayEntry = OverlayEntry(
//      builder: (context){
//        return Text("Text Content",
//            style: TextStyle(
//              decoration: TextDecoration.none,
//            )
//        );
//      },
//    );
////
//    Overlay.of(context).insert(_overlayEntry);

  }

  @override
  Widget build(BuildContext context) {

    EasyLoading.instance.context = context;

    return Scaffold(
      appBar: GradientAppBar(
//        leading:Text("login") ,
        leadings: <Widget>[
          IconButton(icon: Icon(Icons.menu),onPressed: (){
            print(FoundationConfigUntil.navItemSpacing);
          },),
        ],
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu),onPressed: (){},),
          Text("item"),
        ],
        title:Text(S.of(context).denglu),
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
                __test(context);

              },
            ),
            FlatButton(
              child: Text("register"),
              textColor: Colors.blue,
              onPressed: () {
                NavigatorUtil.goRegisterPage(context);
//                Navigator.push( context,
//                    MaterialPageRoute(builder: (context) {
//                      return Register();
//                    }));

              },
            ),


          ],
        ),
      ),
    );
  }

}