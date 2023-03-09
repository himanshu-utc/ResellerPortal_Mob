import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bloc/bloc_login/login_bloc.dart';
import '../../bloc/bloc_main/main_bloc.dart';
import '../../resources/app_navigator/app_navigator.dart';
import '../../resources/colors.dart';
import '../../resources/image_assets.dart';
import '../../resources/strings.dart';
import '../../utils/common_widgets/common_widget.dart';
import '../../utils/listview_scroll_behavior/listview_scroll_behavior.dart';
import '../../utils/sharedpreference_helper/sharepreference_helper.dart';

class SignScreen extends StatefulWidget {
  static const String routeName = "/SignScreen";

  @override
  _SignScreenState createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isHide1 = true, isHide2 = true;
  bool checked = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController streetAddressTwoController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController bankAccountNumberController = TextEditingController();
  TextEditingController contactPersonAddressController = TextEditingController();
  TextEditingController contactPersonNameController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  //TextEditingController contactPersonNameController = TextEditingController();
  //LoginBloc loginBloc = LoginBloc(LoginInitial());

  //late MainBloc mainBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(top: 25),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child:SingleChildScrollView(
            child: Column(
              children: <Widget>[

                const SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:  Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: ColorsHelper.btn_blue(),
                      ),
                    )
                    ,
                    const SizedBox(
                      width: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: textHelper(
                          textAlign: TextAlign.start,
                          title: StringHelper.register,
                          textColor: ColorsHelper.blackColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                  ],
                ),

                assetImageHelper(
                  image: ImageAssets.registrationtopiv,
                ),
                /*loginUserLogo(),*/
                const SizedBox(
                  height: 20,
                ),
                Row(children: [textHelperSimple(
                    textColor: ColorsHelper.blueColor(),
                    title: StringHelper.welcome_to_Digi2L,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),]

                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                    children: [
                      Expanded(child:  textHelperSimple(
                          textColor: ColorsHelper.blackColor(),
                          title: StringHelper.you_are_one_step,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),)]

                ),
                //signupForm

                const SizedBox(
                  height: 20,
                ),

                Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                    textAlign: TextAlign.start,
                    title: StringHelper.business_name,
                    textColor: ColorsHelper.blackColor(),
                    fontWeight: FontWeight.w500, fontSize: 16),),

                const SizedBox(
                  height: 10,
                ),

                textBoxContainer(
                    child: formTextFeildSimple(
                      context: context,
                      controller: businessNameController,
                      formates: "[a-zA-Z]",
                      isValidateForm: true,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      //validation: CommonValidator.emptyValidation
                    )),
                const SizedBox(
                  height: 15,
                ),
                //email_ID
                Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                    textAlign: TextAlign.start,
                    title: StringHelper.contact_person_name,
                    textColor: ColorsHelper.blackColor(),
                    fontWeight: FontWeight.w500, fontSize: 16),),

                const SizedBox(
                  height: 10,
                ),

                textBoxContainer(
                    child: formTextFeildSimple(
                      context: context,
                      controller: contactPersonNameController,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      //validation: CommonValidator.emailValidation
                    )),

                const SizedBox(
                  height: 15,
                ),
                //email_ID
                Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                    textAlign: TextAlign.start,
                    title: StringHelper.contact_person_address,
                    textColor: ColorsHelper.blackColor(),
                    fontWeight: FontWeight.w500, fontSize: 16),),

                const SizedBox(
                  height: 10,
                ),

                textBoxContainer(
                    child: formTextFeildSimple(
                      context: context,
                      controller: contactPersonAddressController,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      //validation: CommonValidator.emailValidation
                    )),

                const SizedBox(
                  height: 15,
                ),
                //email_ID
                Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                    textAlign: TextAlign.start,
                    title: StringHelper.email,
                    textColor: ColorsHelper.blackColor(),
                    fontWeight: FontWeight.w500, fontSize: 16),),

                const SizedBox(
                  height: 10,
                ),

                textBoxContainer(
                    child: formTextFeildSimple(
                      context: context,
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      //validation: CommonValidator.emailValidation
                    )),

                const SizedBox(
                  height: 15,
                ),
                //email_ID
                Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                    textAlign: TextAlign.start,
                    title: StringHelper.evc_mobile_number,
                    textColor: ColorsHelper.blackColor(),
                    fontWeight: FontWeight.w500, fontSize: 16),),

                const SizedBox(
                  height: 10,
                ),

                textBoxContainer(
                    child: formTextFeildSimple(
                      context: context,
                      controller: phoneController,
                      textInputType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      //validation: CommonValidator.emailValidation
                    )),

                const SizedBox(
                  height: 15,
                ),
                //email_ID
                Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                    textAlign: TextAlign.start,
                    title: StringHelper.address_line_1,
                    textColor: ColorsHelper.blackColor(),
                    fontWeight: FontWeight.w500, fontSize: 16),),

                const SizedBox(
                  height: 10,
                ),

                textBoxContainer(
                    child: formTextFeildSimple(
                      context: context,
                      controller: streetAddressController,
                      textInputType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      //validation: CommonValidator.emailValidation
                    )),

                const SizedBox(
                  height: 15,
                ),
                //email_ID
                Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                    textAlign: TextAlign.start,
                    title: StringHelper.address_line_2,
                    textColor: ColorsHelper.blackColor(),
                    fontWeight: FontWeight.w500, fontSize: 16),),

                const SizedBox(
                  height: 10,
                ),

                textBoxContainer(
                    child: formTextFeildSimple(
                      context: context,
                      controller: streetAddressTwoController,
                      textInputType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      //validation: CommonValidator.emailValidation
                    )),

                const SizedBox(
                  height: 15,
                ),
                //email_ID
                Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                    textAlign: TextAlign.start,
                    title: StringHelper.state,
                    textColor: ColorsHelper.blackColor(),
                    fontWeight: FontWeight.w500, fontSize: 16),),

                const SizedBox(
                  height: 10,
                ),

                textBoxContainer(
                    child: formTextFeildSimple(
                      context: context,
                      controller: stateController,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      //validation: CommonValidator.emailValidation
                    )),

                const SizedBox(
                  height: 15,
                ),
                //email_ID
                Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                    textAlign: TextAlign.start,
                    title: StringHelper.pincode,
                    textColor: ColorsHelper.blackColor(),
                    fontWeight: FontWeight.w500, fontSize: 16),),

                const SizedBox(
                  height: 10,
                ),

                textBoxContainer(
                    child: formTextFeildSimple(
                      context: context,
                      controller: pincodeController,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      //validation: CommonValidator.emailValidation
                    )),

                const SizedBox(
                  height: 15,
                ),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Divider(
                            thickness: 1,
                            color:ColorsHelper.btn_blue() ,
                            height: 36,
                          )),
                    ),

                    Align(
                      //  alignment: Alignment.centerLeft,
                      child: textHelper(
                          textAlign: TextAlign.start,
                          title: StringHelper.bank,
                          textColor: ColorsHelper.btn_blue(),
                          fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Divider(
                            thickness: 1,
                            color:ColorsHelper.btn_blue(),
                            height: 36,
                          )),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 15,
                ),
                //email_ID
                Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                    textAlign: TextAlign.start,
                    title: StringHelper.bank_name,
                    textColor: ColorsHelper.blackColor(),
                    fontWeight: FontWeight.w500, fontSize: 16),),

                const SizedBox(
                  height: 10,
                ),

                textBoxContainer(
                    child: formTextFeildSimple(
                      context: context,
                      controller: bankNameController,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      //validation: CommonValidator.emailValidation
                    )),

                const SizedBox(
                  height: 15,
                ),
                //email_ID
                Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                    textAlign: TextAlign.start,
                    title: StringHelper.ifsc_code,
                    textColor: ColorsHelper.blackColor(),
                    fontWeight: FontWeight.w500, fontSize: 16),),

                const SizedBox(
                  height: 10,
                ),

                textBoxContainer(
                    child: formTextFeildSimple(
                      context: context,
                      controller: ifscCodeController,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      //validation: CommonValidator.emailValidation
                    )),

                const SizedBox(
                  height: 15,
                ),
                //email_ID
                Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                    textAlign: TextAlign.start,
                    title: StringHelper.bank_account_number,
                    textColor: ColorsHelper.blackColor(),
                    fontWeight: FontWeight.w500, fontSize: 16),),

                const SizedBox(
                  height: 10,
                ),

                textBoxContainer(
                    child: formTextFeildSimple(
                      context: context,
                      controller: bankAccountNumberController,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      //validation: CommonValidator.emailValidation
                    )),

                const SizedBox(
                  height: 20,
                ),

                Row(children: [
                  Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red, value: checked,
                    onChanged: (bool? value) {
                      setState(() {
                        checked=value!;
                      });
                    },
                  ),
                  Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                      textAlign: TextAlign.start,
                      title: "${StringHelper.i_agree_to_the} ",
                      textColor: ColorsHelper.blackColor(),
                      fontWeight: FontWeight.w500, fontSize: 16),),
                  Align(alignment: Alignment.centerLeft,child: textHelperSimple(
                      textAlign: TextAlign.start,
                      title: StringHelper.  terms_and_condidtions,
                      textColor: ColorsHelper.blueColor(),
                      fontWeight: FontWeight.w500, fontSize: 16),)],),

                const SizedBox(
                  height: 40,
                ),

                /*GestureDetector(
                  onTap: (){

                    savedata(context);
                  //  launchSignUpTwoPage(context);

            },
                  child:  Container(
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
                ),*/
                GestureDetector(
                  onTap: (){
                    //showdata(context);
                    //savedata(context);
                    launchSignUpTwoPage(context);

                  },
                  child:  Container(
                    margin: const  EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child:   submitButton(
                        title: StringHelper.save, onPressed: () {  },

                    ),
                  ),
                )
                //Address
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

  void launchSignUpTwoPage(BuildContext context) async {
    // isLogin = await SharePreferencesHelper.getInstant()
    //     .getBool(SharePreferencesHelper.Is_Login);
    // if (isLogin)
    //   AppNavigator.launchDashBoard(context);
    // else
    AppNavigator.launchSignUpTwoScreen(context);
  }

  void savedata (BuildContext context) async{
    /*SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(emailController.text, "abc");*/
    debugPrint("email ==== ${emailController.text.toString()}");
    SharePreferencesHelper.getInstance()!
        .setString(SharePreferencesHelper.Email, emailController.text.toString());
    SharePreferencesHelper.getInstance()!
        .setString(SharePreferencesHelper.Name, businessNameController.text.toString());
    SharePreferencesHelper.getInstance()!
        .setString(SharePreferencesHelper.Email, contactPersonNameController.text.toString());
    SharePreferencesHelper.getInstance()!
        .setString(SharePreferencesHelper.Email, contactPersonAddressController.text.toString());
    SharePreferencesHelper.getInstance()!
        .setString(SharePreferencesHelper.Email, phoneController.text.toString());
    SharePreferencesHelper.getInstance()!
        .setString(SharePreferencesHelper.Email, streetAddressController.text.toString());
    SharePreferencesHelper.getInstance()!
        .setString(SharePreferencesHelper.Email, streetAddressTwoController.text.toString());
    SharePreferencesHelper.getInstance()!
        .setString(SharePreferencesHelper.Email, stateController.text.toString());
    SharePreferencesHelper.getInstance()!
        .setString(SharePreferencesHelper.Email, pincodeController.text.toString());
    SharePreferencesHelper.getInstance()!
        .setString(SharePreferencesHelper.Email, bankAccountNumberController.text.toString());
    SharePreferencesHelper.getInstance()!
        .setString(SharePreferencesHelper.Email, bankNameController.text.toString());
    SharePreferencesHelper.getInstance()!
        .setString(SharePreferencesHelper.Email, ifscCodeController.text.toString());

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
