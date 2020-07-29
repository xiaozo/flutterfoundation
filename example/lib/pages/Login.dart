
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutterfoundation/flutterfoundation/application.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/base_state.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/widget_adapter.dart';
import 'package:flutterfoundation/generated/l10n.dart';
import 'package:flutterfoundation_example/pages/register.dart';
import 'package:flutterfoundation_example/route/LoginRoutes.dart';
import 'package:flutterfoundation_example/untils/navigator_util.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/system/appbar_gradient.dart';
import 'package:flutterfoundation/flutterfoundation/foundation_config_until.dart';
import 'package:flutter_page_tracker/flutter_page_tracker.dart';
import 'package:flutterfoundation_example/widgets/loading.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/loading_view.dart';

class Login extends BaseStatefulWidget
{
  @override
  _LoginState createState() => _LoginState();

}


class _LoginState extends BaseState<Login>
    with TickerProviderStateMixin{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addSubView(
        WidgetAdapter(
            widgetEl: FlatButton
              (
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                NavigatorUtil.goAppPage(context);

              },
            )));

    addSubView(WidgetAdapter(widgetEl:FlatButton(
      child: Text("test btn"),
      textColor: Colors.blue,
      onPressed: () {
        __test(context);

      },
    )));
//
    addSubView(WidgetAdapter(widgetEl:FlatButton(
      child: Text("register"),
      textColor: Colors.blue,
      onPressed: () {
        NavigatorUtil.goRegisterPage(context);

      },
    )));
//
    addSubView(WidgetAdapter(widgetEl:FlatButton(
      child: Text("bottomNavigation"),
      textColor: Colors.blue,
      onPressed: () {
        NavigatorUtil.goBottomNavigationPage(context);

      },
    )));

    addSubView(WidgetAdapter(widgetEl:FlatButton(
      child: Text("showloading"),
      textColor: Colors.blue,
      onPressed: () {
        showLoading();

      },
    )));

    
  }

  void __test(BuildContext context) {
//    Loading.showLoading(context);

//    Application.getIt<NavigateService>().pushNamed("App", arguments: "hi");
//    Application.windowApp.addWidget(IconButton(icon: Icon(Icons.menu),onPressed: (){}));

//    EasyLoading.show(status: 'loading...');
//    EasyLoading.showSuccess('Great Success!');

//    OverlayEntry _overlayEntry = OverlayEntry(
//      builder: (context){
//        return  Positioned(child: Text("Text Content",
//            style: TextStyle(
//              decoration: TextDecoration.none,
//            )
//        ),top: 100,);
//      },
//    );
//
//    Overlay.of(context).insert(_overlayEntry);
//  showLoading();

  }

  @override
  Widget build(BuildContext context) {

    EasyLoading.instance.context = context;
    Widget body = bodyWidgetBychildbodyWidgetBlock((widgets) {

      return Center(
        child: SingleChildScrollView(
            child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:widgets
         )
        )
      );
    });

    return Scaffold(
      appBar: GradientAppBar(
//        leading:Text("login") ,
        leadings: <Widget>[
          IconButton(icon: Icon(Icons.menu),onPressed: (){
            print(FoundationConfigUntil.navItemSpacing);
          },),
        ],
        actions: <Widget>[
          IconButton(icon: Icon(Icons.person_add),onPressed: (){
            hideLoading();
            LoadingView.hideLoading(context);
          },),
          Text("item"),
        ],
        title:Text(S.of(context).denglu),
      ),
      body: body,
    );
  }

}