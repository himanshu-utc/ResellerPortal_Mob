import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:utc_reseller/src/ui_screens/login_signup/forgot_password.dart';
import 'package:utc_reseller/src/ui_screens/login_signup/login.dart';
import 'package:utc_reseller/src/ui_screens/login_signup/send_password_successfully.dart';
import 'package:utc_reseller/src/ui_screens/registration/confirm_otp.dart';
import 'package:utc_reseller/src/ui_screens/registration/confirm_otp_successfully.dart';
import 'package:utc_reseller/src/ui_screens/registration/signup.dart';
import 'package:utc_reseller/src/ui_screens/registration/signup_three.dart';
import 'package:utc_reseller/src/ui_screens/registration/signup_two.dart';
import 'package:utc_reseller/src/ui_screens/splash/splash.dart';
import 'package:utc_reseller/src/utils/net_connectivity/connectionService.dart';
import 'package:utc_reseller/src/utils/net_connectivity/nonetconnection.dart';
import 'package:utc_reseller/src/utils/pagerouting/slideleftroute.dart';

import 'bloc/bloc_dashboard/dashboard_bloc.dart';
import 'bloc/bloc_main/main_bloc.dart';


class App extends StatelessWidget {
  final MainBloc mainBloc = MainBloc(MainInitial());
  DashboardBloc dashboardBloc = DashboardBloc(DashboardInitial());

  void dispose() {
    mainBloc.close();
    //dashboardBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    print(mainBloc.name);
    mainBloc.name = "app";
    return

        BlocProvider(
            create:(context) => dashboardBloc,
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "StringHelper.app_name",
            home: BlocProvider(create: (context) => mainBloc, child: Splash()),
            onGenerateRoute: routes,
          ),);
    /*  BlocProvider(
      create: (context) => dashboardBloc,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "StringHelper.app_name",
        home: BlocProvider(create: (context) => mainBloc, child: Splash()),
        onGenerateRoute: routes,
      ),
    );*/
  }

  Route routes(RouteSettings settings) {
    var page;
    String? routeName = settings.name;
    switch (routeName) {
    //Splash
      case Splash.routeName:
        page = BlocProvider(create: (context) => mainBloc, child: Splash());
        break;
      case LoginScreen.routeName:
        page = BlocProvider(create: (context) => mainBloc, child: LoginScreen());
        break;
      case SignScreen.routeName:
        page = BlocProvider(create: (context) => mainBloc, child: SignScreen());
        break;
      case SignUpTwoScreen.routeName:
        page = BlocProvider(create: (context) => mainBloc, child: SignUpTwoScreen());
        break;
      case SignUpThreeScreen.routeName:
        page = BlocProvider(create: (context) => mainBloc, child: SignUpThreeScreen());
        break;
      case ForgotPassword.routeName:
        page = BlocProvider(create: (context) => mainBloc, child: ForgotPassword());
        break;
      case SendPasswordSuccessful.routeName:
        page = BlocProvider(create: (context) => mainBloc, child: SendPasswordSuccessful());
        break;
      case ConfirmOtpScreen.routeName:
        page = BlocProvider(create: (context) => mainBloc, child: ConfirmOtpScreen());
        break;

      case ConfirmOTPSuccessful.routeName:
        page = BlocProvider(create: (context) => mainBloc, child: ConfirmOTPSuccessful());
        break;

      /*case RegistrationScreen.routeName:
        page = BlocProvider(create: (context) => mainBloc, child: RegistrationScreen());
        break;*/
    }


    return SlideLeftRoute(
        widget: StreamBuilder(
            stream: ConnectionService.getInstance().connectionStatus,
            builder:
                (BuildContext context, AsyncSnapshot<dynamic> netConnection) {
              if (netConnection.data != null) {
                return netConnection.data ? page : const NoNetConnection();
              } else {
                return const NoNetConnection();
              }
            })
      // page
    );

  }
}
