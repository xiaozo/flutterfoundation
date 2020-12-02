
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutterfoundation/flutterfoundation.dart';
import 'package:flutterfoundation/flutterfoundation/application.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/base_state.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/widget_adapter.dart';
import 'package:flutterfoundation_example/nets/net_utils.dart';
import 'package:flutterfoundation_example/pages/WebViewExample.dart';
import 'package:flutterfoundation_example/pages/register.dart';
import 'package:flutterfoundation_example/pages/test.dart';
import 'package:flutterfoundation_example/route/LoginRoutes.dart';
import 'package:flutterfoundation_example/untils/navigator_util.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/system/appbar_gradient.dart';
import 'package:flutterfoundation/flutterfoundation/foundation_config_until.dart';
import 'package:flutter_page_tracker/flutter_page_tracker.dart';
import 'package:flutterfoundation_example/widgets/loading.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/loading_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import 'DropDownMenu.dart';
import 'expansion_titlePage.dart';

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

    WidgetsBinding.instance.addPostFrameCallback((call) {
      print("addPostFrameCallback");
    });

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
        _test(context);

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

    addSubView(WidgetAdapter(widgetEl:FlatButton(
      child: Text("ExpansionTitlePage"),
      textColor: Colors.blue,
      onPressed: () {
        //导航到新路由
        Navigator.push( context,
            MaterialPageRoute(builder: (context) {
              return ExpansionTitlePage();
            }));

      },
    )));

    addSubView(WidgetAdapter(widgetEl:FlatButton(
      child: Text("webview"),
      textColor: Colors.blue,
      onPressed: () {

        Navigator.push( context,
            MaterialPageRoute(builder: (context) {
              return WebViewExample();
            }));

      },
    )));

    addSubView(WidgetAdapter(widgetEl:FlatButton(
      child: Text("DropDownMenu"),
      textColor: Colors.blue,
      onPressed: () {

        Navigator.push( context,
            MaterialPageRoute(builder: (context) {
              return DropDownMenu();
            }));

      },
    )));

    addSubView(WidgetAdapter(widgetEl:FlatButton(
      child: Text("TEST"),
      textColor: Colors.blue,
      onPressed: () {

        Navigator.push( context,
            MaterialPageRoute(builder: (context) {
              return Test();
            }));

      },
    )));

    
  }

  void showImagePicker(type) async {
    var image = await ImagePicker.pickImage(source: type ==1?ImageSource.camera: ImageSource.gallery);

  }
  Future<void> _test(BuildContext context) async {
//    showImagePicker(1);
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

//    String plainText = '{\n  \"input_data\" : {\n\n  },\n  \"api_version\" : \"10000\",\n  \"function\" : \"common\\/appVersion\",\n  \"unique_data\" : \"4|11605|1597109927|9b84f630c248c1527093c15a75f862200ee018a5|4538567|f24ed1458cb249e483b0884b606e84a3\",\n  \"token\" : \"\"\n}';
    String plainText = "我是shyandsy，never give up man";
    String key = "fa5c76efcc3c9bfe";
    String iv = "11a1f773e5612639";
//    String encryptedString = await Cipher2.encryptAesCbc128Padding7(plainText, key, iv);
//    print(encryptedString);
////    String key = "E6876647D98615ED662BEF60A26A524D";
////   String encryptedString = '{\n  \"input_data\" : {\n\n  },\n  \"api_version\" : \"10000\",\n  \"function\" : \"common\\/appVersion\",\n  \"unique_data\" : \"4|11605|1597109927|9b84f630c248c1527093c15a75f862200ee018a5|4538567|f24ed1458cb249e483b0884b606e84a3\",\n  \"token\" : \"\"\n}';
//    String c = await Cipher2.decryptAesCbc128Padding7(encryptedString, key, iv) as String;
//    print(c);
//    print(Flutterfoundation.encodingJsonNetworkDataWithFunction("common/appVersion","4538567","B7302E121B6F4864226D8387A102A489","E6876647D98615ED662BEF60A26A524D","0",{"a":1,"b":2},null));
    NetUtils.login({"phone":"18559836572","password":"078779DEDC2F53553E0C234384650525"});
  }

  @override
  Widget build(BuildContext context) {

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

    return Container(
//        decoration:BoxDecoration(
//            image: DecorationImage(
//                image: AssetImage("images/1.jpg"),
//                fit: BoxFit.cover
//            )
//        ),
      child:Scaffold(
//      backgroundColor: Colors.transparent,
        appBar: GradientAppBar(
//        elevation: 0,
//        backgroundColor: Colors.transparent,
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
          title:Text("登录"),
        ),
        body: body,
      ),
    );
//    return ;
  }

}