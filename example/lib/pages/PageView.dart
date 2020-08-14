
import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/base_state.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/system/appbar_gradient.dart';

class PageView extends BaseStatefulWidget {
  @override
  _PageViewState createState() => _PageViewState();
}

class _PageViewState extends BaseState<PageView> {
  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    Widget body = bodyWidgetBychildbodyWidgetBlock((widgets) {

      return Center(
          child: SingleChildScrollView(
              child:SizedBox(
                width: 300,
                height: 300,
                child: PageView(

                ),
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

          title:Text("登录"),
        ),
        body: body,
      ),
    );
  }
}