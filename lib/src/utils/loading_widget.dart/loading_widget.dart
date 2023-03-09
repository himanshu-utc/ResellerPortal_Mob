import 'package:flutter/material.dart';

import '../../resources/colors.dart';


class LoadingWidget {
  static endLoadingWidget(BuildContext context) {
    Navigator.pop(context);
  }

  /*static startLoadingWidget(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () => null,
            child: Center(
              child: SpinKitCircle(
                color: ColorsHelper.whiteColor(),
                size: 50.0,
              ),
            ),
          );
        });
  }*/
}
