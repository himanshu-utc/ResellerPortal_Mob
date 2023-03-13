import 'dart:developer';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resources/app_navigator/app_navigator.dart';
import '../../resources/colors.dart';
import '../../resources/image_assets.dart';
import '../../resources/strings.dart';
import '../../utils/common_widgets/common_widget.dart';
import '../../utils/net_connectivity/myConnection.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isHide = true;
   Map _source = {ConnectivityResult.none: false};
  final MyConnectivity _connectivity = MyConnectivity.instance ;

  TextEditingController emailController = TextEditingController();
  TextEditingController passswordController = TextEditingController();

  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  // MainBloc mainBloc;

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
   // log('data: result ${ConnectivityResult.none}');

    if(ConnectivityResult.none==ConnectivityResult.none){
      log('data: offline');
    }

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.grey, //top bar color
      statusBarIconBrightness: Brightness.dark, //top bar icons
      systemNavigationBarColor: Colors.white, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ));
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(top: 35),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          decoration: const BoxDecoration(
            color: Colors.white,
            image:  DecorationImage(
              image: AssetImage("assets/loginbg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [

                const SizedBox(
                  height: 30,
                ),

                Container(
                    child: assetImageHelper(
                        image: ImageAssets.logintopiv,height: 180)),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: textHelper(
                          textAlign: TextAlign.start,
                          title: StringHelper.login,
                          textColor: ColorsHelper.blackColor(),
                          fontWeight: FontWeight.w600,
                          fontSize: 26),
                    ),

                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: const Divider(
                            thickness: 1.8,
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 30,
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: textHelper(
                      textAlign: TextAlign.start,
                      title: StringHelper.enter_your_email,
                      textColor: ColorsHelper.blackColor(),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),

                const SizedBox(
                  height: 10,
                ),

                textBoxContainer(
                    child: formTextFeild(
                      context: context,
                      controller: emailController,
                      focusNode: emailNode,
                      nextFocusNode: passwordNode,
                      hintText: StringHelper.email_ID,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      //    validation: CommonValidator.emailValidation
                    )),

                const SizedBox(
                  height: 20,
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: textHelper(
                      textAlign: TextAlign.start,
                      title: StringHelper.pass,
                      textColor: ColorsHelper.blackColor(),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),

                const SizedBox(
                  height: 10,
                ),

                textBoxContainer(
                    child: PassformTextFeild(
                        context: context,
                        controller: passswordController,
                        focusNode: passwordNode,
                        nextFocusNode: null,
                        hintText: StringHelper.password,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.done,

                        // validation: CommonValidator.passValidation,
                        obscureText: isHide,
                        suffixIcon: true,
                        suffixFuncton: () {
                          if (mounted) {
                            isHide = !isHide;
                            setState(() {});
                          }
                        })),

                const SizedBox(
                  height: 20,
                ),

                GestureDetector(
                  onTap: (){
                    launchForgetPassPage(context);
                  },
                  child: Align (
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: const  EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child:   textHelper(
                          textAlign: TextAlign.start,
                          title: StringHelper.forgot_password,
                          textColor: ColorsHelper.btn_blue(),
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ) ,
                  )

                 ,
                ),

               /* Align(
                  alignment: Alignment.centerRight,
                  child: textHelper(
                      textAlign: TextAlign.start,
                      title: StringHelper.forgot_Password,
                      textColor: ColorsHelper.btn_blue(),
                      fontWeight: FontWeight.w700),
                ),*/

                const SizedBox(
                  height: 40,
                ),

                GestureDetector(
                  onTap: (){
                    //dashboardPage(context);
                  },
                  child:  Container(
                    margin: const  EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child:   submitNewButtonBlue(
                        title: StringHelper.login,


                    ),
                  ),
                )
                ,

                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: const Divider(
                            thickness: 1,
                            color: Colors.black,
                            height: 36,
                          )),
                    ),

                    Align(
                      //  alignment: Alignment.centerLeft,
                      child: textHelper(
                          textAlign: TextAlign.start,
                          title: StringHelper.or,
                          textColor: ColorsHelper.blackColor(),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: const Divider(
                            thickness: 1,
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                GestureDetector(
                  onTap: (){
                    launchSignUpPage(context);
                  },
                  child:  Container(
                    margin: const  EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child:   submitNewButtonGreen(
                        title: StringHelper.sign_Up,

                    ),
                  ),
                )
               ,

                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
      ),
    );
  }

  /*void launchRegistrationPage(BuildContext context) async {
    // isLogin = await SharePreferencesHelper.getInstant()
    //     .getBool(SharePreferencesHelper.Is_Login);
    // if (isLogin)
    //   AppNavigator.launchDashBoard(context);
    // else
    AppNavigator.launchRegistrationScreen(context);
  }*/

  void launchForgetPassPage(BuildContext context) async {
    // isLogin = await SharePreferencesHelper.getInstant()
    //     .getBool(SharePreferencesHelper.Is_Login);
    // if (isLogin)
    //   AppNavigator.launchDashBoard(context);
    // else
    AppNavigator.forgetPassScreen(context);
  }

  void launchSignUpPage(BuildContext context) async {
    // isLogin = await SharePreferencesHelper.getInstant()
    //     .getBool(SharePreferencesHelper.Is_Login);
    // if (isLogin)
    //   AppNavigator.launchDashBoard(context);
    // else
    AppNavigator.launchSignupScreen(context);
  }


  void dashboardPage(BuildContext context) async {
    // isLogin = await SharePreferencesHelper.getInstant()
    //     .getBool(SharePreferencesHelper.Is_Login);
    // if (isLogin)
    //   AppNavigator.launchDashBoard(context);
    // else
    AppNavigator.dashboardScreen(context);
  }
}