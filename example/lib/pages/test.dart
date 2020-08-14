import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/base_state.dart';

class Test extends BaseStatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends BaseState<Test>  {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Text("注册"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
//        fit: StackFit.expand, //未定位widget占满Stack整个空间
          children: [
            Padding(
                padding: EdgeInsets.all(15),
              child:  Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("注册"),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("cc"),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child:  DecoratedBox(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                              borderRadius: BorderRadius.circular(3.0), //3像素圆角
                              boxShadow: [ //阴影
                                BoxShadow(
                                    color:Colors.black54,
                                    offset: Offset(2.0,2.0),
                                    blurRadius: 4.0
                                )
                              ]
                          ),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white),),
                          )
                      ),
                    )

                  ],
                ),
              ),
            ),
            Image(
              image: NetworkImage(
                  "https://pcdn.flutterchina.club/imgs/3-17.png"),
              width: 100.0,
            )


          ],
        ),
      ),
    );

  }
}