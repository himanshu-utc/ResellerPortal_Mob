import 'package:flutter/material.dart';
import 'package:utc_reseller/src/ui_screens/registration/signup.dart';

import '../../ui_screens/dashboard/dashboard.dart';
import '../../ui_screens/login_signup/forgot_password.dart';
import '../../ui_screens/login_signup/login.dart';
import '../../ui_screens/login_signup/send_password_successfully.dart';
import '../../ui_screens/registration/confirm_otp.dart';
import '../../ui_screens/registration/confirm_otp_successfully.dart';
import '../../ui_screens/registration/signup_three.dart';
import '../../ui_screens/registration/signup_two.dart';

class AppNavigator {
  //LoginScreen
  static void launchLoginScreen(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        LoginScreen.routeName, (Route<dynamic> route) => false);
  }

  //SignUpScreen
  static void launchSignupScreen(BuildContext context) {
    Navigator.pushNamed(context,
        SignScreen.routeName,);
  }

  //SignUpTwoScreen
  static void launchSignUpTwoScreen(BuildContext context) {
    Navigator.pushNamed(context,
      SignUpTwoScreen.routeName,);
  }

  //SignUpTwoScreen
  static void launchSignUpThreeScreen(BuildContext context) {
    Navigator.pushNamed(context,
      SignUpThreeScreen.routeName,);
  }

  //DashboardScreen
  static void dashboardScreen(BuildContext context) {
    Navigator.pushNamed(context,
      DashBoard.routeName,);
  }

  //ForgetPasswordScreen
  static void forgetPassScreen(BuildContext context) {
    Navigator.pushNamed(context,
      ForgotPassword.routeName,);
  }

  // SendPasswordSuccessfulScreen
  static void sendPassSuccessfulScreen(BuildContext context) {
    Navigator.pushNamed(context,
      SendPasswordSuccessful.routeName,);
  }

  // SendPasswordSuccessfulScreen
  static void confirmOtpScreen(BuildContext context) {
    Navigator.pushNamed(context,
      ConfirmOtpScreen.routeName,);
  }

  // ConfirmOTPSuccessfulScreen
  static void confirmOTPSuccessfulScreen(BuildContext context) {
    Navigator.pushNamed(context,
      ConfirmOTPSuccessful.routeName,);
  }

  //RegistrationScreen
  /*static void launchRegistrationScreen(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        RegistrationScreen.routeName, (Route<dynamic> route) => false);
  }*/

  static void popBackStack(BuildContext context) {
    Navigator.pop(context);
  }
}
