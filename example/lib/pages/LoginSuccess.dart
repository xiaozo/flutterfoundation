import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/Application.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/base_state.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/widget_adapter.dart';
import 'package:flutterfoundation_example/route/AppRouteHelp.dart';
import 'package:flutterfoundation_example/route/SuccessRoutes.dart';
import 'package:flutterfoundation_example/untils/navigator_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_page_tracker/flutter_page_tracker.dart';

import 'LoginSuccess1.dart';

class LoginSuccess extends BaseStatefulWidget {
  @override
  _LoginSuccessState createState() => _LoginSuccessState();
}

class _LoginSuccessState extends BaseState<LoginSuccess>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);

    addSubView(WidgetAdapter(
      widgetEl: _tabbar
    ));



    addSubView(WidgetAdapter(
        widgetEl:_body));
  }

  Widget _tabbar () {
    Widget tabbar = TabBar(
      indicatorColor: Colors.red,
      indicatorSize: TabBarIndicatorSize.tab,
      isScrollable: true,
      labelColor: Colors.red,
      unselectedLabelColor: Colors.black,
      indicatorWeight: 5.0,
      labelStyle: TextStyle(height: 2),
      controller: _tabController,
      tabs: [
        Tab(
          text: '1',
        ),
        Tab(
          text: '2',
        ),
      ],
    );

    return tabbar;
  }

  Widget _body () {
    Widget body = Expanded(
        child: TabBarView(
            controller: _tabController, children:
        [
          LoginSuccess1(),
          LoginSuccess1()
        ]));
    return body;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetBody =
        bodyWidgetBychildbodyWidgetBlock((List<Widget> widgets) {
      return Column(
        children: widgets,
      );
    });

    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        preferredSize: Size.zero,
      ),
      body: widgetBody,
    );
  }
}
