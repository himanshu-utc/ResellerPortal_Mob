import 'package:flutter/material.dart';
import '../../bloc/bloc_login/login_bloc.dart';
import '../../resources/colors.dart';
import '../../resources/image_assets.dart';
import '../../resources/strings.dart';
import '../../utils/common_widgets/common_widget.dart';

class SendPasswordSuccessful extends StatefulWidget {
  static const String routeName = "/SendPasswordSuccessful";

  @override
  _SendPasswordSuccessfulState createState() => _SendPasswordSuccessfulState();
}

class _SendPasswordSuccessfulState extends State<SendPasswordSuccessful> {
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

          child: Center(
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

                const SizedBox(
                  height: 100,
                ),

                assetImageHelper(
                  image: ImageAssets.green_tick_iv,
                ),
                /*loginUserLogo(),*/
                const SizedBox(
                  height: 40,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [textHelper(
                    textColor: ColorsHelper.blueColor(),
                    title: StringHelper.email_sent,
                    fontSize: 20,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold),
                ]
                ),

                const SizedBox(
                  height: 20,
                ),

                Row(
                    children: [
                      Expanded(child: textHelperSimple(
                          textColor: ColorsHelper.blackColor(),
                          title: StringHelper.please_check_your_email,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),)
                    ]
                ),
                //signupForm
                const SizedBox(
                  height: 60,
                ),

                GestureDetector(
                  onTap: (){
                    //dashboardPage(context);
                  },

                  child:  Container(
                    margin: const  EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child:   submitButton(
                        title: StringHelper.login,
                        onPressed: () {
                        }
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}