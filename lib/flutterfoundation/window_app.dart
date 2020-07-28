
import 'package:flutter/material.dart';

import 'application.dart';


typedef Widget WindowAppRootCallback(BuildContext context);

class WindowApp extends StatelessWidget {

  // This widget is the root of your application.
  WindowApp({
    Key key,
    @required
    this.windowAppRootCallback,
  }) : super(key: key);
  
  final WindowAppRootCallback windowAppRootCallback;

   void setRootWidget(Widget rootWidget) {
     Application.eventBus.emit("setRootWidget",rootWidget);
  }

  void addWidget(Widget widget) {
    Application.eventBus.emit("addWidget",widget);
  }

  void removeWidget(Widget widget) {
    Application.eventBus.emit("removeWidget",widget);
  }

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       home: WindowAppPage(
           windowAppRootCallback: this.windowAppRootCallback),
     );

//    Widget materialApp =  this.windowAppCallback();
//    return materialApp;
  }

}

class WindowAppPage extends StatefulWidget {
  WindowAppPage({Key key,
    @required
    this.windowAppRootCallback
  }): super(key: key);

  final WindowAppRootCallback windowAppRootCallback;

  final TextDirection textDirection =TextDirection.ltr;


  @override
  _WindowAppPageState createState() => _WindowAppPageState();

}

class _WindowAppPageState  extends State <WindowAppPage>{

  _WindowAppPageState({
    Key key,
  });

  List<dynamic> _widgetElList = [];
  Widget _rootWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Application.eventBus.on("setRootWidget", (arg) {
      // do something
      debugPrint("onsetRootWidget");
      setState(() {
        _rootWidget = arg;
       });
    });

    Application.eventBus.on("addWidget", (arg) {
      // do something
      debugPrint("addWidget");
      setState(() {
       _widgetElList.add(arg);
      });
    });

    Application.eventBus.on("removeWidget", (arg) {
      // do something
      debugPrint("removeWidget");
      setState(() {
        _widgetElList.remove(arg);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("windowapp buid");

    List<Widget> widgetList = [];

    if (_rootWidget == null) {
      _rootWidget = widget.windowAppRootCallback(context);
    }

//    _rootWidget = widget.windowAppRootCallback(context);
    widgetList.add(_rootWidget);

    _widgetElList.forEach((element) {
      if (element is Function) {
        widgetList.add(element());
      } else if (element is Widget) {
        widgetList.add(element);
      }

    });

    return Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: Colors.white,
      body:Stack(
        alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
        children:widgetList,
      ),
    );

//    return Directionality(
//      child: Stack(
//        alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
//        children:widgetList,
//      ),
//      textDirection: widget.textDirection,
//    );
  }
}