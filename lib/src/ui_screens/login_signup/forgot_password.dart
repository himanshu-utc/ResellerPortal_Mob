import 'package:flutter/material.dart';
import '../../bloc/bloc_login/login_bloc.dart';
import '../../resources/app_navigator/app_navigator.dart';
import '../../resources/colors.dart';
import '../../resources/image_assets.dart';
import '../../resources/strings.dart';
import '../../utils/common_widgets/common_widget.dart';

class ForgotPassword extends StatefulWidget {
  static const String routeName = "/ForgotPassword";

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passswordController = TextEditingController();

  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  LoginBloc loginBloc = LoginBloc(LoginInitial());

  @override
  void dispose() {
    loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      width: 20,
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: textHelper(
                          textAlign: TextAlign.start,
                          title: StringHelper.forget_password,
                          textColor: ColorsHelper.blackColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
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
                    title: StringHelper.trouble_logging_in,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                ]
                ),

                const SizedBox(
                  height: 10,
                ),

                Row(
                    children: [
                      Expanded(child: textHelperSimple(
                          textColor: ColorsHelper.blackColor(),
                          title: StringHelper.enter_the_email_associated,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),)
                    ]
                ),
                //signupForm
                const SizedBox(
                  height: 30,
                ),

                textBoxContainer(
                    child: formTextFeild(
                      context: context,
                      controller: emailController,
                      focusNode: emailNode,
                      nextFocusNode: passwordNode,
                      hintText: StringHelper.enter_your_email,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                       // validation: CommonValidator.emailValidation
                    )),

                const SizedBox(
                  height: 40,
                ),

                GestureDetector(
                  onTap: (){
                    sendPassSuccessfulPage(context);
                  },

                  child:  Container(
                    margin: const  EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child:   submitButton(
                        title: StringHelper.send,
                        onPressed: () {
                        }
                    ),
                  ),
                ),

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
                          fontWeight: FontWeight.w500),
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
                    Navigator.pop(context);
                  },

                  child:  Container(
                    margin: const  EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child:   submitButtonGreen(
                        title: StringHelper.back_to_login,
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

  void sendPassSuccessfulPage(BuildContext context) async {
    // isLogin = await SharePreferencesHelper.getInstant()
    //     .getBool(SharePreferencesHelper.Is_Login);
    // if (isLogin)
    //   AppNavigator.launchDashBoard(context);
    // else
    AppNavigator.sendPassSuccessfulScreen(context);
  }
}