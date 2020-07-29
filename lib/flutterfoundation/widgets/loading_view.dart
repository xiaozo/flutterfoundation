import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoundation/flutterfoundation/widgets/widget_mixture.dart';

import 'base_stateless_widget.dart';


class LoadingView extends BaseStatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     color: Colors.transparent,
     child: Align(
       child: ClipRRect(
         borderRadius: BorderRadius.circular(10),
         child: Container(
           width: 100,
           height: 100,
           color: Colors.black54,
           child: CupertinoActivityIndicator(),
         ),
       ),
     ),
   );
  }

  ///展示最外层的加载框
  static bool isLoading = false;

  static void showLoading(BuildContext context) {
    if (!isLoading) {
      isLoading = true;
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel:
          MaterialLocalizations.of(context).modalBarrierDismissLabel,
          transitionDuration: const Duration(milliseconds: 150),
          pageBuilder: (BuildContext context, Animation animation,
              Animation secondaryAnimation) {
            return Align(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.black54,
                  child: CupertinoActivityIndicator(),
                ),
              ),
            );
          }).then((v) {
        isLoading = false;
      });
    }
  }

  static void hideLoading(BuildContext context) {
    if (isLoading) {
      Navigator.of(context).pop();
    }
  }
}

