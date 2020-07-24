
import 'package:flutter/material.dart';

import 'application.dart';


typedef MaterialApp WindowAppCallback();

class WindowApp extends StatelessWidget {

  // This widget is the root of your application.
  WindowApp({
    Key key,
    @required
    this.windowAppCallback,
  }) : super(key: key);
  
  final WindowAppCallback windowAppCallback;

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

    MaterialApp materialApp =  this.windowAppCallback();
    return materialApp;
  }

}

class WindowAppPage extends StatefulWidget {
  WindowAppPage({Key key,
    @required
    this.rootWidget
  }): super(key: key);
  final Widget rootWidget;

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
    _rootWidget = widget.rootWidget;

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

    if (_rootWidget != null) widgetList.add(_rootWidget);

    _widgetElList.forEach((element) {
      if (element is Function) {
        widgetList.add(element());
      } else if (element is Widget) {
        widgetList.add(element);
      }

    });

    return Scaffold(
      backgroundColor: Colors.white,
      body:ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
          children:widgetList,
        ),
      ),
    );
  }
}