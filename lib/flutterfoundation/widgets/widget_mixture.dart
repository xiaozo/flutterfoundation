
import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/Common/view_bus.dart';
import 'package:flutterfoundation/flutterfoundation/application.dart';

import 'loading_view.dart';
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
  WidgetAdapter _loadingViewAdapter;
  bool _isLoading = false;

  void showLoading() {
    if (!_isLoading) {
      _isLoading = true;
      if (_loadingViewAdapter == null) {
        _loadingViewAdapter = WidgetAdapter(
            depth:2,
            widgetEl:Positioned(
                child: LoadingView(),
              left: 0,right: 0,top: 0,bottom: 0,
            )
        );
      }

      addTopSubView(_loadingViewAdapter);
    }
  }

  void hideLoading() {
    if (_isLoading) {
      _isLoading = false;
      removeWidgetAdapter(_loadingViewAdapter);
    }
  }

  void addSubView(WidgetAdapter widgetAdapter){

    _addSubView(widgetElList,widgetAdapter);
    update();
  }

  void addTopSubView(WidgetAdapter widgetAdapter){
    _addSubView(widgetTopElList,widgetAdapter);
    update();
  }

  void bringTopSubviewToFront(WidgetAdapter widgetAdapter) {
    _bringSubviewToFront(widgetTopElList,widgetAdapter);
  }

  void sendTopSubviewToBack(WidgetAdapter widgetAdapter) {
    _sendSubviewToBack(widgetTopElList, widgetAdapter);

  }


  void bringSubviewToFront(WidgetAdapter widgetAdapter) {
    _bringSubviewToFront(widgetElList,widgetAdapter);

  }

  void sendSubviewToBack(WidgetAdapter widgetAdapter) {
   _sendSubviewToBack(widgetElList, widgetAdapter);

  }

  Widget bodyWidgetBychildbodyWidgetBlock (ChildbodyWidgetBlock childbodyWidgetblock){
    List<Widget> widgets = _getWidgets(widgetElList);
    List<Widget> topwidgets = _getWidgets(widgetTopElList);
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
    List<Widget> widgets = _getWidgets(widgetElList);
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
    bus.emit(widgetAdapter.eventName);

  }

  void update() {

  }

  List<Widget> _getWidgets (List<WidgetAdapter> elList) {
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
          isTopElList == true ? _removeWidgetAdapter(widgetTopElList,element):_removeWidgetAdapter(widgetElList,element);
        });
      }


    });

    return widgets;
  }

  void _addSubView( List<WidgetAdapter> widgetAdapters,WidgetAdapter widgetAdapter) {
    if (widgetAdapters.length == 0) {
      widgetAdapters.add(widgetAdapter);
    } else {

      for (int i = widgetAdapters.length - 1;i >= 0; i--) {
        WidgetAdapter twidgetAdapter = widgetAdapters[i];
        if (twidgetAdapter.depth <= widgetAdapter.depth) {
          widgetAdapters.insert((i + 1), widgetAdapter);
          break;
        }
      }
    }

  }

  void _sendSubviewToBack(List<WidgetAdapter> widgetAdapters,WidgetAdapter widgetAdapter) {
    debugPrint("_sendSubviewToBack");
    if (widgetAdapters.indexOf(widgetAdapter) != -1) {
      widgetAdapters.remove(widgetAdapter);

      if (widgetAdapters.length == 0) {
        widgetAdapters.add(widgetAdapter);
        update();
      } else {
        for (int i = 0; i < widgetAdapters.length;i++) {
          WidgetAdapter twidgetAdapter = widgetAdapters[i];
          if (twidgetAdapter.depth >= widgetAdapter.depth) {
            widgetAdapters.insert((i), widgetAdapter);
            update();
            break;
          }
        }
      }

    }
  }

  void _bringSubviewToFront(List<WidgetAdapter> widgetAdapters,WidgetAdapter widgetAdapter) {
    debugPrint("_sendSubviewToBack");
    if (widgetAdapters.indexOf(widgetAdapter) != -1) {
      widgetAdapters.remove(widgetAdapter);
      _addSubView(widgetAdapters,widgetAdapter);
      update();
    }
  }

  void _removeWidgetAdapter(List<WidgetAdapter> widgetAdapters,WidgetAdapter widgetAdapter) {
    debugPrint("_removeWidgetAdapter");
    widgetAdapters.remove(widgetAdapter);
    bus.off(widgetAdapter.eventName);
    update();
  }

}