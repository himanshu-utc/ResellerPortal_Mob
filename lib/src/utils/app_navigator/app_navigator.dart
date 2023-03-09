import 'package:flutter/material.dart';

import '../../ui_screens/login_signup/login.dart';

class AppNavigator {
  //LoginScreen
  static void launchLoginScreen(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        LoginScreen.routeName, (Route<dynamic> route) => false);
  }

  //SignScreen
 /* static void launchSignScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      SignScreen.routeName,
    );
  }*/



  //ImageViwer
  /*static void launchImageViewerScreen(
      BuildContext context, String imageDetails) {
    Navigator.push(
        context,
        SlideLeftRoute(
            widget: HeroPhotoViewWrapper(
          imageProvider: NetworkImage(imageDetails),
        )));
  }*/

  static void popBackStack(BuildContext context) {
    Navigator.pop(context);
  }
}
