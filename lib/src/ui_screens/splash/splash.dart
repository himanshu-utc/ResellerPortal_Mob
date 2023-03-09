import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/app_navigator/app_navigator.dart';
import '../../resources/image_assets.dart';
import '../../utils/common_widgets/common_widget.dart';

class Splash extends StatefulWidget {
  static const String routeName = "/";

  //Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  //MainBloc mainBloc;
  bool isLogin = false;

  @override
  void initState() {
    //mainBloc = BlocProvider.of<MainBloc>(context);
    // handleMessageOnForeground();
    Future.delayed(const Duration(milliseconds: 1000), () async {
      launchLoginOrDashboardPage(context);
    });

    super.initState();
  }

  void launchLoginOrDashboardPage(BuildContext context) async {
    // isLogin = await SharePreferencesHelper.getInstant()
    //     .getBool(SharePreferencesHelper.Is_Login);
    // if (isLogin)
    //   AppNavigator.launchDashBoard(context);
    // else
      AppNavigator.launchLoginScreen(context);
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      statusBarIconBrightness: Brightness.dark, //top bar icons
      systemNavigationBarColor: Colors.transparent, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ));
    return Container(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child:
              assetImageHelper(
                  image: ImageAssets.splash)
          ),
      ));
  }
}
