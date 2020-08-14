import 'package:flutter/material.dart';

class DropDownMenu extends StatelessWidget {
  GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("DropDownMenu"),
      ),
      body: Center(
        heightFactor: 1.0,
        child: Container(
          key: _globalKey,
          height: 44,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color(0xffe6e6e6),
                  width: 1.0
              )
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                RenderBox renderBox = _globalKey.currentContext.findRenderObject();
                Rect box = renderBox.localToGlobal(Offset.zero) & renderBox.size;
                print(box);
                Navigator.push(context, _DropDownMenuRoute(position: box, menuHeight: 300));
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "空间类型",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff333333)
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, size: 24, color: Color(0xffe6e6e6))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class _DropDownMenuRouteLayout extends SingleChildLayoutDelegate {

  final Rect position;
  final double menuHeight;

  _DropDownMenuRouteLayout({this.position, this.menuHeight});

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    // TODO: implement getConstraintsForChild
    return BoxConstraints.loose(Size(position.right - position.left, 400));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // TODO: implement getPositionForChild
    return Offset(0, position.bottom);
  }

  @override
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) {
    // TODO: implement shouldRelayout
    return true;
  }

}

class _DropDownMenuRoute extends PopupRoute {

  final Rect position;
  final double menuHeight;

  _DropDownMenuRoute({this.position, this.menuHeight});

  @override
  // TODO: implement barrierColor
  Color get barrierColor => null;

  @override
  // TODO: implement barrierDismissible
  bool get barrierDismissible => true;

  @override
  // TODO: implement barrierLabel
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // TODO: implement buildPage

    return CustomSingleChildLayout(
      delegate: _DropDownMenuRouteLayout(position: position, menuHeight: menuHeight),
      child: SizeTransition(
        sizeFactor: Tween<double>(
            begin: 0.0,
            end: 1.0
        ).animate(animation),
        child: Container(
          color: Color(0xffff0000),
        ),
      ),
    );
  }

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => Duration(milliseconds: 300);

}