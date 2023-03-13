import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bloc_login/login_bloc.dart';
import '../../bloc/bloc_main/main_bloc.dart';
import '../../resources/app_navigator/app_navigator.dart';
import '../../resources/colors.dart';
import '../../resources/image_assets.dart';
import '../../resources/strings.dart';
import '../../utils/common_widgets/common_widget.dart';
import '../../utils/listview_scroll_behavior/listview_scroll_behavior.dart';
import '../../utils/sharedpreference_helper/sharepreference_helper.dart';

class SignUpTwoScreen extends StatefulWidget {
  static const String routeName = "/SignUpTwoScreen";

  @override
  _SignUpTwoScreenState createState() => _SignUpTwoScreenState();
}

class _SignUpTwoScreenState extends State<SignUpTwoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isHide1 = true, isHide2 = true;
  bool checked = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController eWasteNumberController = TextEditingController();
  TextEditingController gstNumberController = TextEditingController();
  TextEditingController pocPlaceController = TextEditingController();
  TextEditingController pocNameController = TextEditingController();
  //LoginBloc loginBloc = LoginBloc(LoginInitial());

  //late MainBloc mainBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(top: 25),
          padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: <Widget>[

            const SizedBox(
              height: 10,
            ),

            Container(
              child:  Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child:  Container(
                      child: Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: ColorsHelper.btn_blue(),
                      ),
                    ),
                  )
                  ,
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
            ),

            const SizedBox(
              height: 30,
            ),

            Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                textAlign: TextAlign.start,
                title: StringHelper.e_waste_registration_number,
                textColor: ColorsHelper.blackColor(),
                fontWeight: FontWeight.w600, fontSize: 14),),

            const SizedBox(
              height: 10,
            ),

            textBoxContainer(
                child: formTextFeildSimple(
                  context: context,
                  controller: eWasteNumberController,
                  formates: "[a-zA-Z]",
                  isValidateForm: true,
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  //validation: CommonValidator.emptyValidation
                )),
            const SizedBox(
              height: 30,
            ),
            //email_ID
            Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                textAlign: TextAlign.start,
                title: StringHelper.gst_number,
                textColor: ColorsHelper.blackColor(),
                fontWeight: FontWeight.w600, fontSize: 14),),

            const SizedBox(
              height: 10,
            ),

            textBoxContainer(
                child: formTextFeildSimple(
                  context: context,
                  controller: gstNumberController,
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  //validation: CommonValidator.emailValidation
                )),

            const SizedBox(
              height: 30,
            ),
            //email_ID
            Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                textAlign: TextAlign.start,
                title: StringHelper.poc_name,
                textColor: ColorsHelper.blackColor(),
                fontWeight: FontWeight.w600, fontSize: 14),),

            const SizedBox(
              height: 10,
            ),

            textBoxContainer(
                child: formTextFeildSimple(
                  context: context,
                  controller: pocNameController,
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  //validation: CommonValidator.emailValidation
                )),

            const SizedBox(
              height: 30,
            ),
            //email_ID
            Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                textAlign: TextAlign.start,
                title: StringHelper.poc_place,
                textColor: ColorsHelper.blackColor(),
                fontWeight: FontWeight.w600, fontSize: 14),),

            const SizedBox(
              height: 10,
            ),

            textBoxContainer(
                child: formTextFeildSimple(
                  context: context,
                  controller: pocPlaceController,
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  //validation: CommonValidator.emailValidation
                )),

            const SizedBox(
              height: 60,
            ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 35),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child:  Container(
                              width: 150,
                              margin: const  EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child:   submitButtonGreen(
                                  title: StringHelper.back,
                                  onPressed: () {

                                  }
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              launchSignUpThreePage(context);
                            },
                            child:  Container(
                              width: 150,
                              margin: const  EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child:   submitButton(
                                  title: StringHelper.save,
                                  onPressed: () {
                                    // callUnfocus(context: context);
                                    // loginBloc.onLoginClick(_formKey).then((value) {
                                    //   if (value) {
                                    //     submit();
                                    //   } else {
                                    //     if (mounted) setState(() {});
                                    //   }
                                    // });
                                  }
                              ),
                            ),
                          )
                          ,
                          const SizedBox(
                            height: 20,
                          ),
                        ],) ),

                ),
              ),
            )

            //Address
          ],
        ),
          /*child:SingleChildScrollView(

          )*/
      ),
    );
  }

  void launchSignUpThreePage(BuildContext context) async {
    // isLogin = await SharePreferencesHelper.getInstant()
    //     .getBool(SharePreferencesHelper.Is_Login);
    // if (isLogin)
    //   AppNavigator.launchDashBoard(context);
    // else
    AppNavigator.launchSignUpThreeScreen(context);
  }

  void savedata (BuildContext context) async{
    /*SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(emailController.text, "abc");*/
    //debugPrint("email ==== ${emailController.text.toString()}");
    SharePreferencesHelper.getInstance()!
        .setString(SharePreferencesHelper.Email, eWasteNumberController.text.toString());
    SharePreferencesHelper.getInstance()!
        .setString(SharePreferencesHelper.Name, gstNumberController.text.toString());
    SharePreferencesHelper.getInstance()!
        .setString(SharePreferencesHelper.Email, pocNameController.text.toString());
    SharePreferencesHelper.getInstance()!
        .setString(SharePreferencesHelper.Email, pocPlaceController.text.toString());
  }

  void showdata (BuildContext context) async{
    /*SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(emailController.text, "abc");*/
    var text_email = await  SharePreferencesHelper.getInstance()!.getString(SharePreferencesHelper.Email) ;
    debugPrint("email ==== ${text_email.toString()}");

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
