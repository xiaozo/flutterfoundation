
import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/Common/view_bus.dart';
import 'package:flutterfoundation/flutterfoundation/application.dart';

import 'widget_adapter.dart';


typedef Widget ChildbodyWidgetBlock( List<Widget> widgets);

///工具
mixin WidgetToolMixture<T extends StatefulWidget> on State<T> {
     void endEditing (){
       FocusScope.of(context).requestFocus(new FocusNode());
     }
}

class WidgetRmoveMixture {
  ViewBus viewBus;
  Object eventName;

  void removeFromSuperview() {
    print("removeFromSuperview");
    if (viewBus != null && eventName != null) {
      viewBus.emit(eventName);
    } else {
      try {
        Application.windowApp.removeWidget(this as Widget);
      } catch (e) {

      }

    }
  }
}

class WidgetMixture {

  @protected
  List<WidgetAdapter> widgetElList = [];
  List<WidgetAdapter> widgetTopElList = [];
  ViewBus bus = ViewBus();

  void addSubView(WidgetAdapter widgetAdapter){
    widgetElList.add(widgetAdapter);
    update();
  }

  void addTopSubView(WidgetAdapter widgetAdapter){
    widgetTopElList.add(widgetAdapter);
    update();
  }

  void bringTopSubviewToFront(WidgetAdapter widgetAdapter) {
    if (widgetTopElList.indexOf(widgetAdapter) != -1) {
      widgetTopElList.remove(widgetAdapter);
      widgetTopElList.add(widgetAdapter);
      update();
    }

  }

  void sendTopSubviewToBack(WidgetAdapter widgetAdapter) {
    if (widgetTopElList.indexOf(widgetAdapter) != -1) {
      widgetTopElList.remove(widgetAdapter);
      widgetTopElList.insert(0, widgetAdapter);
      update();
    }

  }


  void bringSubviewToFront(WidgetAdapter widgetAdapter) {
    if (widgetElList.indexOf(widgetAdapter) != -1) {
      widgetElList.remove(widgetAdapter);
      widgetElList.add(widgetAdapter);
      update();
    }

  }

  void sendSubviewToBack(WidgetAdapter widgetAdapter) {
    if (widgetElList.indexOf(widgetAdapter) != -1) {
      widgetElList.remove(widgetAdapter);
      widgetElList.insert(0, widgetAdapter);
      update();
    }

  }

  Widget bodyWidgetBychildbodyWidgetBlock (ChildbodyWidgetBlock childbodyWidgetblock){
    List<Widget> widgets = __getWidgets(widgetElList);
    List<Widget> topwidgets = __getWidgets(widgetTopElList);
    Widget childbodyWidget = childbodyWidgetblock(widgets);
    topwidgets.insert(0, childbodyWidget);
    return  ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment:Alignment.topLeft , //指定未定位或部分定位widget的对齐方式
        children: topwidgets,
      ),
    );
  }

  Widget bodyWidget () {
    widgetTopElList = widgetElList;
    List<Widget> widgets = __getWidgets(widgetElList);
    return  ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
//        fit: StackFit.expand, //未定位widget占满Stack整个空间
        alignment:Alignment.topLeft , //指定未定位或部分定位widget的对齐方式
        children: widgets,
      ),
    );
  }

  void removeWidgetAdapter(WidgetAdapter widgetAdapter) {
    debugPrint("removeWidgetAdapter");
    widgetElList.remove(widgetAdapter);
    bus.off(widgetAdapter.eventName);
    update();

  }

  void removeTopWidgetAdapter(WidgetAdapter widgetAdapter) {
    debugPrint("removeTopWidgetAdapter");
    widgetTopElList.remove(widgetAdapter);
    bus.off(widgetAdapter.eventName);
    update();

  }



  void update() {

  }

  List<Widget> __getWidgets (List<WidgetAdapter> elList) {
    List<Widget> widgets = [];
    bool isTopElList = (elList == widgetTopElList);
    elList.forEach((WidgetAdapter element) {
      Widget widget = null;
      dynamic widgetEl = element.widgetEl;
      if (widgetEl is Function) {
        if (element.arguments != null )  {
          widget = widgetEl(element.arguments);
        } else {
          widget = widgetEl();
        }

      } else {
        widget = widgetEl;
      }

      widgets.add(widget);

      ///加入eventName viewBus
      try {
        if (!(widget is WidgetRmoveMixture)) {
          dynamic twidget = widget;
          twidget = twidget.child;
          if (twidget is WidgetRmoveMixture) {
            widget = twidget as Widget;
          }

        }
      } catch (e) { // 不指定错误类型，匹配所有

      }

//      if (widget is Positioned) {
//        Positioned positioned = widget as Positioned;
//        widget = positioned.child;
//      }


      if (widget is WidgetRmoveMixture) {
        debugPrint("WidgetRmoveMixture");
        var eventName = element.eventName;
        WidgetRmoveMixture baseStatefulWidget = widget as WidgetRmoveMixture;
        baseStatefulWidget.viewBus = bus;
        baseStatefulWidget.eventName = eventName;
        bus.on(eventName, (arg) {
          isTopElList == true ? removeTopWidgetAdapter(element):removeWidgetAdapter(element);
        });
      }


    });

    return widgets;
  }




}