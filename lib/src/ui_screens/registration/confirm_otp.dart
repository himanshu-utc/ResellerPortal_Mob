import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../bloc/bloc_login/login_bloc.dart';
import '../../bloc/bloc_main/main_bloc.dart';
import '../../resources/app_navigator/app_navigator.dart';
import '../../resources/colors.dart';
import '../../resources/image_assets.dart';
import '../../resources/strings.dart';
import '../../utils/common_widgets/common_widget.dart';
import '../../utils/listview_scroll_behavior/listview_scroll_behavior.dart';

class ConfirmOtpScreen extends StatefulWidget {
  static const String routeName = "/ConfirmOtpScreen";

  @override
  _ConfirmOtpScreenState createState() => _ConfirmOtpScreenState();
}

class _ConfirmOtpScreenState extends State<ConfirmOtpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isHide1 = true, isHide2 = true;
  bool checked = true;
  //LoginBloc loginBloc = LoginBloc(LoginInitial());

  //late MainBloc mainBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(top: 25),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: const BoxDecoration(
            color: Colors.white,
            image:  DecorationImage(
              image: AssetImage("assets/loginbg.png"),
              fit: BoxFit.cover,
            ),
          ),

          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                const SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: ColorsHelper.btn_blue(),
                      ),
                    ),

                    const SizedBox(
                      width: 30,
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: textHelper(
                          textAlign: TextAlign.start,
                          title: StringHelper.register,
                          textColor: ColorsHelper.blackColor(),
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ],
                ),

                assetImageHelper(
                  image: ImageAssets.forgetpasstopiv,
                ),
                /*loginUserLogo(),*/
                const SizedBox(
                  height: 20,
                ),

                Row(children: [textHelperSimple(
                    textColor: ColorsHelper.blueColor(),
                    title: StringHelper.enter_otp,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
                ]
                ),

                const SizedBox(
                  height: 10,
                ),

                Row(
                    children: [
                      Expanded(child: textHelperSimple(
                          textColor: ColorsHelper.blackColor(),
                          title: StringHelper.otp_has_been_send,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),)
                    ]
                ),
                //signupForm
                const SizedBox(
                  height: 10,
                ),

                Row(
                    children: [
                      Expanded(child: textHelperSimple(
                          textColor: ColorsHelper.blackColor(),
                          title: StringHelper.email_hint,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),)
                    ]
                ),
                //signupForm
                const SizedBox(
                  height: 30,
                ),

                OtpTextField(
                  numberOfFields: 4,
                  borderColor: Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  fieldWidth: 60,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode){
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        }
                    );
                  }, // end onSubmit
                ),

                const SizedBox(
                  height: 80,
                ),

                GestureDetector(
                  onTap: (){
                    launchSignUpThreePage(context);
                  },

                  child:  Container(
                    margin: const  EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child:   submitButton(
                        title: StringHelper.verify,
                        onPressed: () {
                        }
                    ),
                  ),
                ),

                const SizedBox(
                  height: 80,
                ),

                GestureDetector(
                  onTap: (){
                    //Navigator.pop(context);
                  },

                  child:  Container(
                    margin: const  EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child:   submitButtonGreen(
                        title: StringHelper.resend,
                        onPressed: () {
                        }
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
      ),
    );
  }

  void launchSignUpThreePage(BuildContext context) async {
    // isLogin = await SharePreferencesHelper.getInstant()
    //     .getBool(SharePreferencesHelper.Is_Login);
    // if (isLogin)
    //   AppNavigator.launchDashBoard(context);
    // else
    AppNavigator.confirmOTPSuccessfulScreen(context);
  }

  /*Widget signupButton() => submitButton(
      title: StringHelper.next,
      onPressed: () {
        callUnfocus(context: context);
        loginBloc.onLoginClick(_formKey).then((value) {
          if (value) {
            if (passswordController.text == confirmPwdController.text) {
              submit();
              *//*if (currentCountry.compareTo('Country') == 0) {
                PopupDialogs.displayMessage(
                    context, StringHelper.please_Select_Country);
              } else {
                submit();
              } *//*
            } else {
              PopupDialogs.displayMessage(context,
                  StringHelper.password_and_Confirm_Password_Do_not_match);
            }
          } else {
            if (mounted) setState(() {});
          }
        });
      });*/
}
