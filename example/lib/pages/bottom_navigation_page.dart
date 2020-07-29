
import 'package:flutter/material.dart';

class BottomNavigationPage extends StatelessWidget {

  BottomNavigationPage({
    @required this.text,  // 接收一个text参数
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("${text}"),
    );
  }
}
